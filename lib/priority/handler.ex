defmodule Priority.Handler do
  use Commanded.Event.Handler,
    application: Priority.App,
    name: __MODULE__

  alias Priority.Events.{PriorityAdded}

  @impl true
  @spec init :: :ok
  def init do
    {:ok, _pid} = Agent.start_link(&initial_priorities/0, name: __MODULE__)
    :ok
  end

  @impl true
  @spec handle(Priority.Event.t(), map()) :: :ok
  def handle(%PriorityAdded{name: name}, _metadata) do
    Agent.update(__MODULE__, fn priorities -> [name | priorities] end)
  end

  @spec priorities :: [String.t()]
  def priorities do
    Agent.get(__MODULE__, fn priorities -> priorities end)
  end

  @spec initial_priorities :: [String.t()]
  defp initial_priorities do
    Application.fetch_env!(:priority, Priority.App)
    |> Keyword.fetch!(:event_store_adapter)
    |> case do
      Commanded.EventStore.Adapters.InMemory ->
        []

      Commanded.EventStore.Adapters.EventStore ->
        {:ok, events} = Priority.EventStore.read_all_streams_forward()

        events
        |> Enum.filter(
          &match?(
            %EventStore.RecordedEvent{event_type: "Elixir.Priority.Events.PriorityAdded"},
            &1
          )
        )
        |> Enum.map(& &1.stream_uuid)
        |> Enum.uniq()
    end
  end
end
