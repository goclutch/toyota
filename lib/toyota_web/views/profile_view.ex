defmodule ToyotaWeb.ProfileView do
  use ToyotaWeb, :view
  alias ToyotaWeb.ProfileView

  def render("index.json", %{profiles: profiles}) do
    %{data: render_many(profiles, ProfileView, "profile.json")}
  end

  def render("show.json", %{profile: profile}) do
    %{data: render_one(profile, ProfileView, "profile.json")}
  end

  def render("profile.json", %{profile: profile}) do
    %{id: profile.id,
      first_name: profile.first_name,
      last_name: profile.last_name}
  end
end
