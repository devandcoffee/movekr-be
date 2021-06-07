defmodule MovekrWeb.Schema do
  use Absinthe.Schema

  alias MovekrWeb.AccountsResolver

  import_types Movekr.Schema.DataTypes

  query do
    @desc "Get all users"
    field :all_users, non_null(list_of(non_null(:user))) do
      resolve(&AccountsResolver.all_users/3)
    end
  end

  mutation do
    @desc "Create a new user"
    field :create_user, :user do
      arg(:user, non_null(:input_user))
      resolve(&AccountsResolver.create_user/3)
    end
  end
end