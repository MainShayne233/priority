defmodule Priority.Events do
  alias Priority.Events.PriorityCreatedEventData

  @expected_version 0

  @spec create_event(number()) :: number()
  def create_event(%PriorityCreatedEventData{name: name} = event_data) do
    do_create_event(name, event_data)
  end

  defp do_create_event(stream_uuid, %event_type{} = event_data) do
    events = [
      %EventStore.EventData{
        event_type: Atom.to_string(event_type),
        data: event_data,
        metadata: %{}
      }
    ]

    :ok = Priority.EventStore.append_to_stream(stream_uuid, @expected_version, events)
  end
end
