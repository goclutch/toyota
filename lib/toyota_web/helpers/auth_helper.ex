defmodule ToyotaWeb.AuthHelper do
    @moduledoc false
    require Logger
    import Comeonin.Bcrypt, only: [checkpw: 2]
    alias Toyota.Repo
    alias Toyota.Accounts.User
  
    def signin_with_email_pass(email, given_pass) do
      user = Repo.get_by(User, email: String.downcase(email))
        Logger.info "Sign IN with Email Pass"
      cond do
        user && checkpw(given_pass, user.password_hash) ->
          {:ok, user}
  
        user ->
          {:error, "Incorrect login credentials"}
  
        true ->
          {:error, :"User not found"}
      end
    end
  end