defmodule MyShopApiWeb.Schema.Mutations.Shop do
  use Absinthe.Schema.Notation

  object :shop_mutations do
    field :update_shop, :shop do
      arg :id, non_null(:id)
      arg :name, :string
      arg :category, :shop_category

      resolve &MyShopApiWeb.Resolver.Shop.update/2
    end
  end
end
