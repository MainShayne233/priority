defmodule Priority.Router do
  use Commanded.Commands.Router

  alias Priority.Commands.{AddPriority}

  dispatch(AddPriority, to: Priority, identity: :name)
end
