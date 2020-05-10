defmodule Priority.Events.PriorityAdded do
  @moduledoc false

  use TypedStruct

  @derive Jason.Encoder
  typedstruct do
    field(:name, String.t(), enforce: true)
  end
end
