defmodule Elementary.HoustonServerWeb.PageLiveTest do
  use Elementary.HoustonServerWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Support Development."
    assert render(page_live) =~ "Support Development."
  end
end
