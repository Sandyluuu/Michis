require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)
    get new_post_url
    assert_response :success
    end

    test "should create post" do
        sign_in users(:one)
        assert_difference("Post.count") do
        post posts_url, params: { post: { description: @post.description, image: @post.image, title: @post.title } }
      end
        assert_redirected_to post_url(Post.last)
      end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
      sign_in users(:one)
      get edit_post_url(@post)
      assert_response :success
    end

    test "should update post" do
        sign_in users(:one)
        patch post_url(@post), params: { post: { description: @post.description, image: @post.image, title: @post.title }
        }
        assert_redirected_to post_url(@post)
      end

      test "should destroy post" do
          sign_in users(:one)
          assert_difference("Post.count", -1) do
          delete post_url(@post)
        end
          assert_redirected_to posts_url
        end

    assert_redirected_to posts_url
  end
end
