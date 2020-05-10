defmodule Priority.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    Priority.Supervisor.start_link()
  end
end
