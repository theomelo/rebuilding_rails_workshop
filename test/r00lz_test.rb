# frozen_string_literal: true

require "test_helper"

class TedController < R00lz::Controller
  def think; "Therefore I am"; end
end

class R00lzTest < Minitest::Test
  def test_new_controller_action
    env = {"PATH_INFO" => "/ted/think", "QUERY_STRING" => ""}
    assert_equal 200, ::R00lz::App.new.call(env)[0]
  end
end
