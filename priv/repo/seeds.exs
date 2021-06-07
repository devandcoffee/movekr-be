# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Movekr.Repo.insert!(%Movekr.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Movekr.Accounts.User
alias Movekr.Repo

%User{name: "Facundo Flores", mail: "fflores@devandcoffee.org", password: "12345"} |> Repo.insert!
%User{name: "Matias Novoa", mail: "mnovoa@devandcoffee.org", password: "12345"} |> Repo.insert!
%User{name: "Javier Ocampo", mail: "jocampo@devandcoffee.org", password: "12345"} |> Repo.insert!
