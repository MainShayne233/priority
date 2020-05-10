defmodule PriorityTest do
  use ExUnit.Case
  import Commanded.Assertions.EventAssertions
  alias Priority.Events.{PriorityAdded}

  describe "add_priority/1" do
    test "success: should be able to add a priority" do
      ## SETUP

      priority_name = Faker.Industry.industry()

      ## KICKOFF

      Priority.add_priority(priority_name)

      ## ASSERTIONS

      assert_receive_event(Priority.App, PriorityAdded, fn event ->
        assert event.name == priority_name
      end)
    end
  end
end
