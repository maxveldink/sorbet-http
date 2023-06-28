# typed: strict
# frozen_string_literal: true

module Typed
  module HTTP
    # Enumerates all valid HTTP response status codes and
    # provides conversion and convenience methods.
    class StatusCode < T::Enum
      extend T::Sig

      enums do
        Ok = new
        Created = new
        BadRequest = new
        InternalServerError = new
      end

      class << self
        extend T::Sig

        sig { params(int: Integer).returns(StatusCode) }
        def from_i(int)
          case int
          when 200
            Ok
          when 201
            Created
          when 400
            BadRequest
          when 500
            InternalServerError
          else
            raise ArgumentError, "#{int} is not a valid HTTP status code."
          end
        end

        alias from_code from_i
      end

      sig { returns(Integer) }
      def to_i
        case self
        when Ok
          200
        when Created
          201
        when BadRequest
          400
        when InternalServerError
          500
        else
          T.absurd(self)
        end
      end

      alias to_code to_i

      sig { returns(T::Boolean) }
      def success?
        to_i.digits[-1] == 2
      end
    end
  end
end
