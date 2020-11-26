# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended.
import Config

domain =
  System.get_env("DOMAIN") ||
    raise """
    environment variable DOMAIN is missing.
    Please set this to the domain you are hosting the houston_server on
    """

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :houston_server, Elementary.HoustonServerWeb.Endpoint,
  url: [host: domain],
  secret_key_base: secret_key_base
