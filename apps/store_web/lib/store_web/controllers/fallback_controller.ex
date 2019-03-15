defmodule StoreWeb.FallbackController do
  @moduledoc """

  """

  use StoreWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(StoreWeb.ChangesetView)
    |> render("error.json", changeset: changeset)
  end

  def call(conn, {:errors, errors}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(StoreWeb.ChangesetView)
    |> render("errors.json", errors: errors)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(StoreWeb.ErrorView)
    |> render(:"404")
  end
end
