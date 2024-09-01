defmodule MyShopApiWeb.Types.Shop do
  use Absinthe.Schema.Notation

  enum :shop_category do
    description "A shop category"
    value :hardware
    value :clothing
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

    field :address, :shop_address
  end
end
