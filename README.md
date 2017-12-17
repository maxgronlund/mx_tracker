# MxTracker

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
  * API tutorial https://medium.com/@ilovethebends/phoenix-post-request-87c79370cc20

## deployment

  * $ heroku run:detached "POOL_SIZE=2 mix ecto.migrate"

## migrations

  * $ mix phx.gen.json Trackers MxTracker mx_trackers tracker_name:string tracker_url:string tracker_uuid:string tracker_ip:string

## Upcomming resources

  * https://github.com/ueberauth/guardian
  * https://hexdocs.pm/phoenix_pubsub/1.0.2/Phoenix.Tracker.html
  * https://tools.ietf.org/html/rfc7518#section-6.4
  * https://github.com/potatosalad/erlang-jose
  * https://github.com/potatosalad/erlang-ojson
