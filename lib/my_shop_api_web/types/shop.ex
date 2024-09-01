defmodule MyShopApiWeb.Types.Shop do
  use Absinthe.Schema.Notation

  enum :shop_category do
    description "A shop category"
    value :hardware
    value :clothing
  end

  object :shop do
    description "Shops sorted in categories"
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :category, non_null(:shop_category)
  end
end
