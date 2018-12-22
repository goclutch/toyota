defmodule ToyotaWeb.Schema do
    use Absinthe.Schema
    import_types ToyotaWeb.Schema.AccountTypes
  
    alias ToyotaWeb.Resolvers
    require IEx
    query do
  
      @desc "Sign In a user"
      field :signin, type: :session do
        arg(:email, non_null(:string))
        arg(:password, non_null(:string))
      
        resolve(&Resolvers.Accounts.signin/2)
      end

      @desc "Get Current User from Token"
      field :current_user, type: :user do
        resolve(&Resolvers.Accounts.current_user/2)
      end

      @desc "Get all profiles"
      field :profiles, list_of(:profile) do
        resolve &Resolvers.Accounts.list_profiles/3
      end
      
    end

    mutation do

      @desc "Create a user"
      field :signup, type: :session do
        arg :email, non_null(:string)
        arg :password, non_null(:string)
        arg :password_confirmation, non_null(:string)

        resolve &Resolvers.Accounts.create_user/3
      end

      @desc "Create a profile"
      field :create_profile, type: :profile do
        arg :first_name, non_null(:string)
        arg :last_name, non_null(:string)

        resolve &Resolvers.Accounts.create_profile/3
      end

      @desc "Sign Out a user"
      field :sign_out, type: :user do
        resolve(&Resolvers.Accounts.signout/2)
      end
    end
  
  end