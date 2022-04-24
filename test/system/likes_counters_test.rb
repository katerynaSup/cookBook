require "application_system_test_case"

class LikesCountersTest < ApplicationSystemTestCase
  setup do
    @likes_counter = likes_counters(:one)
  end

  test "visiting the index" do
    visit likes_counters_url
    assert_selector "h1", text: "Likes counters"
  end

  test "should create likes counter" do
    visit likes_counters_url
    click_on "New likes counter"

    fill_in "Post", with: @likes_counter.post_id
    fill_in "User", with: @likes_counter.user_id
    click_on "Create Likes counter"

    assert_text "Likes counter was successfully created"
    click_on "Back"
  end

  test "should update Likes counter" do
    visit likes_counter_url(@likes_counter)
    click_on "Edit this likes counter", match: :first

    fill_in "Post", with: @likes_counter.post_id
    fill_in "User", with: @likes_counter.user_id
    click_on "Update Likes counter"

    assert_text "Likes counter was successfully updated"
    click_on "Back"
  end

  test "should destroy Likes counter" do
    visit likes_counter_url(@likes_counter)
    click_on "Destroy this likes counter", match: :first

    assert_text "Likes counter was successfully destroyed"
  end
end
