# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ApiServer.Repo.insert!(%ApiServer.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias  ApiServer.{Repo, Accounts.User}

%User{
  name: "admin",
  password: "admin123",
  full_name: "王磊",
  mobile: "15156709660",
  is_admin: true
}
|> Repo.insert