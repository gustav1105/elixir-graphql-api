defmodule MyShopApi.Retail do
  alias MyShopApi.Repo
  alias MyShopApi.Retail.Shop

  def list_shops do
    Repo.all(Shop)
  end

  def find_shop(%{id: id}) do
    case Repo.get(Shop, id) do
      nil -> {:error, "404"}
      shop -> {:ok, shop}
    end
  end

  def update_shop(id, params) do
    with {:ok, shop} <- find_shop(%{id: id}) do
      shop
        |> Shop.changeset(params)
        |> Repo.update
    end
  end
  
  def create_shop(params) do
    %Shop{}
    |> Shop.changeset(params)
    |> Repo.insert
  end
end
