defmodule MyShopApiWeb.Shop do
  @shops [
    %{
      id: 1,
      name: "Blacky's Shop",
      category: :clothing,
      address: %{
        country: "Blessings INc",
        city: "HopeAlice co"
      }
    },
    %{
      id: 2,
      name: "Tarzan's Collection",
      category: :hardware,
      address: %{
        country: "Ukrainasuim",
        city: "BigOlCIty"
      }
    }
  ]

  def all(%{category: category}) do 
    case Enum.find(@shops, &(&1.category == category)) do
      nil -> {:error, %{message: "not found", details: %{category: category}}}
      shops -> {:ok, shops}
    end
  end
  
  def all(_) do
    {:ok, @shops}
  end

  def find(%{id: id}) do
    case Enum.find(@shops, &(&1.id == id)) do
      nil -> {:error, %{message: "not found", details: %{id: id}}}
      shop -> {:ok, shop}
    end
  end

  def update(id, params) do
    with {:ok, shop} <- find(%{id: id}) do
      {:ok, Map.merge(shop, params)}
    end
  end
end
