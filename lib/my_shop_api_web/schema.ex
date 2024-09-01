defmodule MyShopApiWeb.Schema do
  use Absinthe.Schema

  import_types MyShopApiWeb.Types.Shop
  import_types MyShopApiWeb.Schema.Queries.Shop
  import_types MyShopApiWeb.Schema.Mutations.Shop

  query do
    import_fields :shop_queries
  end

  mutation do
    import_fields :shop_mutations
  end
end
