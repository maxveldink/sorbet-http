# typed: true
# frozen_string_literal: true

require "test_helper"

class StatusCodeTest < Minitest::Test
  def test_from_i_returns_valid_status_code
    assert_equal(Typed::HTTP::StatusCode::OK, Typed::HTTP::StatusCode.from_i(200))
  end

  def test_from_i_raises_if_given_invalid_code
    assert_raises(ArgumentError, "600 is not a valid status code.") { Typed::HTTP::StatusCode.from_i(600) }
  end

  def test_from_code_is_alias_for_from_i
    assert_equal(Typed::HTTP::StatusCode::OK, Typed::HTTP::StatusCode.from_code(200))
  end

  def test_to_i_returns_valid_integer
    assert_equal(200, Typed::HTTP::StatusCode::OK.to_i)
  end

  def test_to_code_aliases_to_i
    assert_equal(200, Typed::HTTP::StatusCode::OK.to_code)
  end

  def test_informational_returns_true_if_100_class_code
    assert_predicate(Typed::HTTP::StatusCode::SwitchingProtocols, :informational?)
    assert_predicate(Typed::HTTP::StatusCode::Processing, :informational?)
  end

  def test_informational_returns_false_if_not_100_class_code
    refute_predicate(Typed::HTTP::StatusCode::BadRequest, :informational?)
    refute_predicate(Typed::HTTP::StatusCode::InternalServerError, :informational?)
  end

  def test_successful_returns_true_if_200_class_code
    assert_predicate(Typed::HTTP::StatusCode::OK, :successful?)
    assert_predicate(Typed::HTTP::StatusCode::Created, :successful?)
  end

  def test_successful_returns_false_if_not_200_class_code
    refute_predicate(Typed::HTTP::StatusCode::BadRequest, :successful?)
    refute_predicate(Typed::HTTP::StatusCode::InternalServerError, :successful?)
  end

  def test_redirection_returns_true_if_300_class_code
    assert_predicate(Typed::HTTP::StatusCode::MultipleChoices, :redirection?)
    assert_predicate(Typed::HTTP::StatusCode::MovedPermanently, :redirection?)
  end

  def test_redirection_returns_false_if_not_300_class_code
    refute_predicate(Typed::HTTP::StatusCode::BadRequest, :redirection?)
    refute_predicate(Typed::HTTP::StatusCode::InternalServerError, :redirection?)
  end

  def test_client_error_returns_true_if_400_class_code
    assert_predicate(Typed::HTTP::StatusCode::BadRequest, :client_error?)
    assert_predicate(Typed::HTTP::StatusCode::Unauthorized, :client_error?)
  end

  def test_client_error_returns_false_if_not_400_class_code
    refute_predicate(Typed::HTTP::StatusCode::OK, :client_error?)
    refute_predicate(Typed::HTTP::StatusCode::InternalServerError, :client_error?)
  end

  def test_server_error_returns_true_if_500_class_code
    assert_predicate(Typed::HTTP::StatusCode::InternalServerError, :server_error?)
    assert_predicate(Typed::HTTP::StatusCode::NotImplemented, :server_error?)
  end

  def test_server_error_returns_false_if_not_500_class_code
    refute_predicate(Typed::HTTP::StatusCode::BadRequest, :server_error?)
    refute_predicate(Typed::HTTP::StatusCode::OK, :server_error?)
  end
end
