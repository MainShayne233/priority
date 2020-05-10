defmodule Priority.EventsTest do
  use ExUnit.Case

  alias Priority.Events
  alias Priority.Events.PriorityCreatedEventData

  describe "create_event/1" do
    test "success: creates an event if provided valid params" do
      ## SETUP

      event_data = %PriorityCreatedEventData{
        name: Faker.Industry.industry()
      }

      ## KICKOFF

      result = Events.create_event(event_data)

      ## ASSERTIONS

      assert result == :ok
    end
  end
end
