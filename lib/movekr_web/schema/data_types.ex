defmodule Movekr.Schema.DataTypes do
  use Absinthe.Schema.Notation

  object :project do
    field :name, non_null(:string)
    field :description, :string
  end

  input_object :input_project do
    field :name, non_null(:string)
    field :description, :string
    field :owner_id, non_null(:id)
  end

  object :user do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :mail, non_null(:string)
    field :password, non_null(:string)
    field :projects, list_of(:project)
  end

  input_object :input_user do
    field :name, non_null(:string)
    field :mail, non_null(:string)
    field :password, non_null(:string)
  end


end
