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

  def context(ctx) do
    source = Dataloader.Ecto.new(MyShopApi.Repo)
    dataloader = Dataloader.add_source(Dataloader.new(), MyShopApi.Retail, source) 

    Map.put(ctx, :loader, dataloader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
