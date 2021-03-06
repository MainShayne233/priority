defmodule Priority.Commands.AddPriority do
  @moduledoc false

  use TypedStruct

  @derive Jason.Encoder
  typedstruct do
    field(:name, String.t(), enforce: true)
  end
end
