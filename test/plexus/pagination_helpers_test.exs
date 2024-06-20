defmodule Plexus.PaginationHelpersTest do
  use ExUnit.Case, async: true

  alias Plexus.PaginationHelpers

  describe "page_opts/1" do
    test "with page and page_size" do
      assert [page: 9, page_size: 30] = PaginationHelpers.page_opts(%{page_size: 30, page: 9})
    end

    test "with limit" do
      assert [page_size: 30] = PaginationHelpers.page_opts(%{limit: 30})
    end

    test "with page only" do
      assert [page: 3] = PaginationHelpers.page_opts(%{page: 3})
    end

    test "with empty map" do
      assert [] = PaginationHelpers.page_opts(%{})
    end

    test "with non supported key/values" do
      assert [] = PaginationHelpers.page_opts(%{bogus: :value})
    end
  end
end
