defmodule ToyotaWeb.Resolvers.Accounts do

    def list_profiles(_parent, _args, _resolution) do
      {:ok, Toyota.Accounts.list_profiles()}
    end

end