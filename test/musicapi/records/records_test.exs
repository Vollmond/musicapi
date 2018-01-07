require IEx
defmodule Musicapi.RecordsTest do
  use Musicapi.DataCase

  alias Musicapi.Records

  describe "albums" do
    alias Musicapi.Records.Album

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def album_fixture(attrs \\ %{}) do
      {:ok, album} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Records.create_album()

      album
    end

    test "list_albums/1 with empty args returns all albums" do
      album = album_fixture()
      assert Records.list_albums(%{}) == [album]
    end

    test "list_albums/1 with filter returns filtered albums" do
      album1 = album_fixture(listened: true)
      _album2 = album_fixture(listened: false)
      assert Records.list_albums(%{listened: true}) == [album1]
    end

    test "get_album!/1 returns the album with given id" do
      album = album_fixture()
      assert Records.get_album!(album.id) == album
    end

    test "create_album/1 with valid data creates a album" do
      assert {:ok, %Album{} = album} = Records.create_album(@valid_attrs)
      assert album.name == "some name"
    end

    test "create_album/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Records.create_album(@invalid_attrs)
    end

    test "update_album/2 with valid data updates the album" do
      album = album_fixture()
      assert {:ok, album} = Records.update_album(album, @update_attrs)
      assert %Album{} = album
      assert album.name == "some updated name"
    end

    test "update_album/2 with invalid data returns error changeset" do
      album = album_fixture()
      assert {:error, %Ecto.Changeset{}} = Records.update_album(album, @invalid_attrs)
      assert album == Records.get_album!(album.id)
    end

    test "delete_album/1 deletes the album" do
      album = album_fixture()
      assert {:ok, %Album{}} = Records.delete_album(album)
      assert_raise Ecto.NoResultsError, fn -> Records.get_album!(album.id) end
    end

    test "change_album/1 returns a album changeset" do
      album = album_fixture()
      assert %Ecto.Changeset{} = Records.change_album(album)
    end
  end
end
