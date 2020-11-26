defmodule Elementary.HoustonServerWeb.LanguageController do
  use Elementary.HoustonServerWeb, :controller

  alias Elementary.HoustonServerWeb.Gettext, as: Gtext

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def set(conn, %{"lang" => lang} = params) do
    redirect_path = Map.get(params, "path", Routes.index_path(conn, :index))

    if Enum.member?(Gtext.known_language_codes(), lang) do
      language_name = Map.get(Gtext.known_languages(), lang)

      conn
      |> Gtext.put_language(lang)
      |> put_flash(
        :info,
        Gtext.dgettext("language", "Your language has been set to %{language}",
          language: language_name
        )
      )
      |> redirect(to: redirect_path)
    else
      conn
      |> put_flash(
        :error,
        Gtext.dgettext("language", "Unknown language code %{code}", code: lang)
      )
      |> redirect(to: redirect_path)
    end
  end
end
