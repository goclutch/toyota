# Deployment Procedure

1. Commit changes to **master** branch through direct commit, merge, or pull request.
2. Run `$ mix edeliver build release production --verbose` to build release on remote server
3. Run `$ mix edeliver deploy release to production` to deliver release to remote server
4. Run `$ mix edeliver stop production` to stop prior release version
5. Run `$ mix edeliver start production` to start new release
6. SSH into deploy `ssh deploy@142.93.177.220` account and confirm release is running with `lsof -i :4000`
7. Kill any non-used screens and start a new screen with `screen`
8. Within new screen tail logs: `tail -f ./toyota/var/log/erlang.log.1`

# Phoenix Related

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
