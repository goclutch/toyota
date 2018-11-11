defmodule ToyotaWeb.Schema.AccountTypes do
    use Absinthe.Schema.Notation
  
    @desc "A profile"
    object :profile do
      field :id, :id
      field :first_name, :string
      field :last_name, :string
    end
  end