require "test_helper"

class LikesCountersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @likes_counter = likes_counters(:one)
  end

  test "should get index" do
    get likes_counters_url
    assert_response :success
  end

  test "should get new" do
    get new_likes_counter_url
    assert_response :success
  end

  test "should create likes_counter" do
    assert_difference("LikesCounter.count") do
      post likes_counters_url, params: { likes_counter: { post_id: @likes_counter.post_id, user_id: @likes_counter.user_id } }
    end

    assert_redirected_to likes_counter_url(LikesCounter.last)
  end

  test "should show likes_counter" do
    get likes_counter_url(@likes_counter)
    assert_response :success
  end

  test "should get edit" do
    get edit_likes_counter_url(@likes_counter)
    assert_response :success
  end

  test "should update likes_counter" do
    patch likes_counter_url(@likes_counter), params: { likes_counter: { post_id: @likes_counter.post_id, user_id: @likes_counter.user_id } }
    assert_redirected_to likes_counter_url(@likes_counter)
  end

  test "should destroy likes_counter" do
    assert_difference("LikesCounter.count", -1) do
      delete likes_counter_url(@likes_counter)
    end

    assert_redirected_to likes_counters_url
  end
end
