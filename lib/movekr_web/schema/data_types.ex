defmodule Movekr.Schema.DataTypes do
  use Absinthe.Schema.Notation

  object :column do
    field :name, non_null(:string)
    field :order, :integer
  end

  input_object :input_columns do
    field :names, non_null(list_of(non_null(:string)))
    field :project_id, :id
  end

  input_object :input_column do
    field :name, non_null(:string)
  end

  object :project do
    field :name, non_null(:string)
    field :description, :string
  end

  input_object :input_project do
    field :name, non_null(:string)
    field :description, :string
    field :owner_id, non_null(:id)
    field :columns, list_of(:input_column)
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
