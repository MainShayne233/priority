import Config

config :priority, event_stores: [Priority.EventStore]

config :priority, Priority.EventStore,
  column_data_type: "jsonb",
  serializer: EventStore.JsonbSerializer,
  types: EventStore.PostgresTypes

import_config "#{Mix.env()}.exs"
