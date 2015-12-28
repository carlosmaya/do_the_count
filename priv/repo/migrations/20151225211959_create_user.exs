defmodule DoTheCount.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false
      add :email, :string, null: false
      add :balance, :float
      add :password_hash, :string

      timestamps
    end

    create unique_index(:users, [:email])
  end
end
