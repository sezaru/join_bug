defmodule JoinBug.MyApi do
  @moduledoc false

  use Ash.Api

  resources do
    resource JoinBug.MyApi.MyResource
  end
end
