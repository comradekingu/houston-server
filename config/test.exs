import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :houston_server, Elementary.HoustonServerWeb.Endpoint, http: [port: 4002]

config :wallaby,
  base_url: "http://localhost:4002",
  driver: Wallaby.Selenium,
  selenium: [
    capabilities: %{
      browserName: "chrome"
    }
  ],
  opt_app: :houston_server,
  screenshot_dir: Path.expand("#{__DIR__}/../test/houston_server_client_errors"),
  screenshot_on_failure: true,
  sql_sandbox: true

# Print only warnings and errors during test
config :logger, level: :warn
