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

  def registration_changeset(user, params) do
    user
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 8, max: 16)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
