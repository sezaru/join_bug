# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     JoinBug.Repo.insert!(%JoinBug.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias JoinBug.MyApi.MyResource

Application.put_env(:ash, :missed_notifications, :ignore)

Enum.each([:postgrex, :ecto, :join_bug], &Application.ensure_all_started/1)

resources_args = [
  %{
    external_id: "999999999",
    first_grantor_full_name: "A",
    first_grantee_full_name: "B"
  },
  %{
    external_id: "166842475",
    first_grantor_full_name: "A",
    first_grantee_full_name: "B"
  },
  %{
    external_id: "166842475",
    first_grantor_full_name: "B",
    first_grantee_full_name: "C"
  },
  %{
    external_id: "149628232",
    first_grantor_full_name: "A",
    first_grantee_full_name: "B"
  },
]

Enum.each(resources_args, fn args -> MyResource.create!(args) end)
