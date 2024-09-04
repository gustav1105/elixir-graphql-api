defmodule MyShopApi.Repo do
  use Ecto.Repo,
    otp_app: :my_shop_api,
    adapter: Ecto.Adapters.Postgres
end
