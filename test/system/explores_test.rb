require "application_system_test_case"

class ExploresTest < ApplicationSystemTestCase
  setup do
    @explore = explores(:one)
  end

  test "visiting the index" do
    visit explores_url
    assert_selector "h1", text: "Explores"
  end

  test "should create explore" do
    visit explores_url
    click_on "New explore"

    fill_in "Hashtag search", with: @explore.hashtag_search
    click_on "Create Explore"

    assert_text "Explore was successfully created"
    click_on "Back"
  end

  test "should update Explore" do
    visit explore_url(@explore)
    click_on "Edit this explore", match: :first

    fill_in "Hashtag search", with: @explore.hashtag_search
    click_on "Update Explore"

    assert_text "Explore was successfully updated"
    click_on "Back"
  end

  test "should destroy Explore" do
    visit explore_url(@explore)
    click_on "Destroy this explore", match: :first

    assert_text "Explore was successfully destroyed"
  end
end
