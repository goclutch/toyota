defmodule ToyotaWeb.Schema.AccountTypes do
    use Absinthe.Schema.Notation
  
    @desc "A user"
    object :user do
      field :id, :id
      field :email, :string
      field :profile, list_of(:profile)
      field :token, :string
    end

    @desc "A session"
    object :session do
      field :token, :string
      field :id, :id
    end

    @desc "A profile"
    object :profile do
      field :id, :id
      field :first_name, :string
      field :last_name, :string
      field :user_id, :id
    end
  end