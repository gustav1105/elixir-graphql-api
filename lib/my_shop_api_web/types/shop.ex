defmodule MyShopApiWeb.Types.Shop do
  use Absinthe.Schema.Notation
  
  import Absinthe.Resolution.Helpers, only: [dataloader: 2]

  enum :shop_category do
    description "A shop category"
    value :hardware
    value :clothing
  end

  input_object :shop_address_input do
    field :country, non_null(:string)
    field :city, non_null(:string)
  end

  object :shop_address do
    description "Where is it on a map"
    field :country, :string
    field :city, :string
  end
  
  object :shop do
    description "Shops sorted in categories"
    field :id, :id
    field :name, :string
    field :category, :shop_category

    field :address, :shop_address, resolve: dataloader(MyShopApi.Retail, :address)
  end
end
