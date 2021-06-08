defmodule MovekrWeb.Schema do
  use Absinthe.Schema

  alias MovekrWeb.AccountsResolver
  alias MovekrWeb.ProjectsResolver

  import_types(Movekr.Schema.DataTypes)

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

    @desc "Create a new project"
    field :create_project, :project do
      arg(:project, non_null(:input_project))
      resolve(&ProjectsResolver.create_project/3)
    end

    @desc "Create a new columns"
    field :create_columns, list_of(:column) do
      arg(:columns, non_null(:input_columns))
      resolve(&ProjectsResolver.create_columns/3)
    end
  end
end
