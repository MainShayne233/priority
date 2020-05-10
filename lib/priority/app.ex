defmodule Priority.App do
  @moduledoc false

  use Commanded.Application,
    otp_app: :priority,
    event_store: [
      adapter:
        Application.fetch_env!(:priority, __MODULE__) |> Keyword.fetch!(:event_store_adapter),
      event_store: Priority.EventStore
    ]

  router(Priority.Router)
end
