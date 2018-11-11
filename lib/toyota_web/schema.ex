defmodule ToyotaWeb.Schema do
    use Absinthe.Schema
    import_types ToyotaWeb.Schema.AccountTypes
  
    alias ToyotaWeb.Resolvers
  
    query do
  
      @desc "Get all profiles"
      field :profiles, list_of(:profile) do
        resolve &Resolvers.Accounts.list_profiles/3
      end
  
    end
  
  end