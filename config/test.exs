use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :do_the_count, DoTheCount.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Set a higher stacktrace during test
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :do_the_count, DoTheCount.Repo,
  adapter: Mongo.Ecto,
  database: "do_the_count_test",
  pool_size: 1
