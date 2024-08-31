defmodule MyShopApiWeb.Schema do
  use Absinthe.Schema

  enum :shop_category do
    description "A shop category"
    value :hardware
    value :clothing
  end

  object :shop do
    description "A shop"
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :category, non_null(:shop_category)
  end

  @shops [
    %{
      id: 1,
      name: "Blacky's Shop",
      category: :clothing
    },
    %{
      id: 2,
      name: "Tarzan's Collection",
      category: :hardware
    }
  ]

  query do
    field :shop, :shop do
      arg :id, non_null(:id)
      resolve fn %{id: id}, _ ->
        id = String.to_integer(id)

        case Enum.find(@shops, &(&1.id == id)) do
          nil -> {:error, %{message: "not found", details: %{id: id}}}
          shop -> {:ok, shop}
        end
      end
    end

    field :shops, list_of(:shop) do
      arg :category, :shop_category

      resolve fn %{category: category}, _ ->
        shops = Enum.filter(@shops, &(&1.category == category))

        if shops == [] do
          {:error, %{message: "not found", details: %{category: category}}}
        else
          {:ok, shops}
        end
      end
    end
  end
end

