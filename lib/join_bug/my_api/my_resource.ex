defmodule JoinBug.MyApi.MyResource do
  @moduledoc false

  alias JoinBug.MyApi.MyResource

  use Ash.Resource,
    data_layer: AshPostgres.DataLayer

  code_interface do
    define_for JoinBug.MyApi

    define :create

    define :by_entity
  end

  attributes do
    attribute :id, :uuid do
      default &Ash.UUID.generate/0

      primary_key? true
      allow_nil? false
    end

    attribute :external_id, :string, allow_nil?: false

    attribute :first_grantee_full_name, :string
    attribute :first_grantor_full_name, :string

    timestamps(private?: false)
  end

  relationships do
    has_one :sell_record, MyResource do
      no_attributes? true

      filter expr(external_id == parent(external_id) and first_grantor_full_name == parent(first_grantee_full_name))
    end
  end

  postgres do
    table "records"

    repo JoinBug.Repo
  end

  actions do
    defaults [:create, :update, :read]

    read :by_entity do
      argument :entity_full_name, :string, allow_nil?: false

      filter expr(first_grantee_full_name == ^arg(:entity_full_name))

      prepare build(load: [:sell_record])
    end
  end
end
