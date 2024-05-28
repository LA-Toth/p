defmodule Blog.Content.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :body, :string
    field :published, :boolean, default: false
    field :slug, :string

    belongs_to :user, Blog.Accounts.User
    belongs_to :category, Blog.Content.Category

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :published, :slug, :category_id])
    |> validate_required([:title, :body, :published, :slug, :category_id])
  end
end
