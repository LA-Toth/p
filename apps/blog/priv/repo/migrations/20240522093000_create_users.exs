defmodule Blog.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false
      add :username, :string, null: false
      add :password_hash, :string
      timestamps()
    end

    create unique_index(:users, [:username])
  end
end
