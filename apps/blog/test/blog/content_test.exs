defmodule Blog.ContentTest do
  use Blog.DataCase

  alias Blog.Content

  describe "posts" do
    alias Blog.Content.Post

    import Blog.ContentFixtures

    @invalid_attrs %{title: nil, body: nil, published: nil, user_id: nil, slug: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Content.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Content.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{title: "some title", body: "some body", published: true, user_id: 42, slug: "some slug"}

      assert {:ok, %Post{} = post} = Content.create_post(valid_attrs)
      assert post.title == "some title"
      assert post.body == "some body"
      assert post.published == true
      assert post.user_id == 42
      assert post.slug == "some slug"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{title: "some updated title", body: "some updated body", published: false, user_id: 43, slug: "some updated slug"}

      assert {:ok, %Post{} = post} = Content.update_post(post, update_attrs)
      assert post.title == "some updated title"
      assert post.body == "some updated body"
      assert post.published == false
      assert post.user_id == 43
      assert post.slug == "some updated slug"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_post(post, @invalid_attrs)
      assert post == Content.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Content.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Content.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Content.change_post(post)
    end
  end
end
