defmodule Priority.Supervisor do
  use Supervisor

  @spec start_link([]) :: Supervisor.on_start()
  def start_link([]) do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(_) do
    children = [
      Priority.App,
      Priority.Handler
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
