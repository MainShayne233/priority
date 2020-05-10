import Config

config :priority, Priority.EventStore,
  serializer: EventStore.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "priority_eventstore_test",
  hostname: "localhost"
