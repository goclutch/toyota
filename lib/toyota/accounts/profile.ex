defmodule Toyota.Accounts.Profile do
  use Ecto.Schema
  import Ecto.Changeset
  alias Toyota.Accounts.User


  schema "profiles" do
    field :first_name, :string
    field :last_name, :string

    belongs_to :user, User
    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:first_name, :last_name])
    |> validate_required([:first_name, :last_name])
  end
end
