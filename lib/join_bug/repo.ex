defmodule JoinBug.Repo do
  use AshPostgres.Repo, otp_app: :join_bug

  def installed_extensions, do: ["uuid-ossp"]
end
