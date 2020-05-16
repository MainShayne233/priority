defmodule Priority do
  use TypedStruct

  alias Priority.Commands.{AddPriority}
  alias Priority.Events.{PriorityAdded}

  typedstruct do
    field(:name, String.t(), enforce: true)
    field(:active, boolean(), enforce: true)
  end

  @spec add_priority(String.t()) :: :ok
  def add_priority(priority_name) do
    Priority.App.dispatch(%AddPriority{name: priority_name})
  end

  # Public command API

  @spec execute(t(), Priority.Command.t()) :: Priority.Event.t()
  def execute(_priority, %AddPriority{
        name: name
      }) do
    %PriorityAdded{name: name}
  end

  # State mutators

  @spec apply(t(), Priority.Event.t()) :: t()
  def apply(%Priority{} = priority, %PriorityAdded{name: name}) do
    %Priority{priority | name: name}
  end
end
