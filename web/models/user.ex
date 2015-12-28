defmodule DoTheCount.User do
  use DoTheCount.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :balance, :float
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps
  end

  @require_fields ~w(name email)
  @optional_fields ~w(balance)

  def changeset(user, params \\ :empty) do
    user
    |> cast(params, @require_fields, @optional_fields)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end

end
