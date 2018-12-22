defmodule ToyotaWeb.Resolvers.Accounts do
    import ToyotaWeb.AuthHelper
    import IEx
    # def signin(%{email: email, password: password}, _info) do
    #   Logger.info "SIGN IN 1"
    #   Logger.info "RESULTANT IS #{inspect(Toyota.Accounts.token_sign_in(email, password))}"
    #   {:ok, Toyota.Accounts.token_sign_in(email, password)}
    # end
    def signin(%{email: email, password: password}, _info) do
      with {:ok, user} <- signin_with_email_pass(email, password),
           {:ok, jwt, _} <- Toyota.Guardian.encode_and_sign(user),
           {:ok, _ } <- Toyota.Accounts.store_token(user, jwt) do
        {:ok, %{token: jwt, id: user.id}}
      end
    end
    def signin(_args, _info) do
      {:error, "Signin error"}
    end
    def signout(_args,  %{context: %{current_user: current_user, token: _token}}) do
      Toyota.Accounts.revoke_token(current_user, nil)
      {:ok, current_user}
    end
    
    def signout(_args, _info) do
      {:error, "Please sign in first!"}
    end

    def create_user(_parent, args, _info) do
      with {:ok, user} <- Toyota.Accounts.create_user(args),
           {:ok, jwt, _} <- Toyota.Guardian.encode_and_sign(user),
           {:ok, _} <- Toyota.Accounts.store_token(user, jwt) do
        {:ok, %{token: jwt, id: user.id}}
      end
    end
    def create_user(_parent, _args, _resolution) do
      {:error, "Access denied"}
    end

    def create_profile(_parent, args,  %{context: %{current_user: current_user, token: _token}}) do
      if !current_user.profile do 
        with {:ok, profile} <- Toyota.Accounts.create_profile(current_user, args) do
          {:ok, %{id: profile.id}}
        end
      else
        {:error, "A profile already exists for this user"}
      end
    end

    def create_profile(_parent, _args, _resolution) do
      {:error, "Access denied"}
    end

    def current_user(_args,  %{context: %{current_user: current_user, token: _token}}) do
      {:ok, current_user}
    end
    def current_user(_args, _info) do
      {:error, "Could not fetch current user"}
    end

    def list_profiles(_parent, _args, %{context: %{current_user: _current_user}}) do
      {:ok, Toyota.Accounts.list_profiles()}
    end

    def list_profiles(_parent, _args, _resolution) do
      {:error, "Access denied"}
    end
end