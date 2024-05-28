defmodule Blog.Content.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :body, :string
    field :published, :boolean, default: false
    belongs_to :user, Blog.Accounts.User
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :published, :slug])
    |> validate_required([:title, :body, :published, :slug])
  end
end
