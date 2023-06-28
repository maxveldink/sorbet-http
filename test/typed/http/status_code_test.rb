# typed: true
# frozen_string_literal: true

require "test_helper"

class StatusCodeTest < Minitest::Test
  def test_from_i_returns_valid_status_code
    assert_equal(Typed::HTTP::StatusCode::Ok, Typed::HTTP::StatusCode.from_i(200))
  end

  def test_from_i_raises_if_given_invalid_code
    assert_raises(ArgumentError, "600 is not a valid status code.") { Typed::HTTP::StatusCode.from_i(600) }
  end

  def test_from_code_is_alias_for_from_i
    assert_equal(Typed::HTTP::StatusCode::Ok, Typed::HTTP::StatusCode.from_code(200))
  end

  def test_to_i_returns_valid_integer
    assert_equal(200, Typed::HTTP::StatusCode::Ok.to_i)
  end

  def test_to_code_aliases_to_i
    assert_equal(200, Typed::HTTP::StatusCode::Ok.to_code)
  end

  def test_success_returns_true_if_200_class_code
    assert_predicate(Typed::HTTP::StatusCode::Ok, :success?)
    assert_predicate(Typed::HTTP::StatusCode::Created, :success?)
  end

  def test_success_returns_false_if_not_200_class_code
    refute_predicate(Typed::HTTP::StatusCode::BadRequest, :success?)
    refute_predicate(Typed::HTTP::StatusCode::InternalServerError, :success?)
  end
end
