# typed: strict
# frozen_string_literal: true

module Typed
  module HTTP
    # Enumerates all valid HTTP response status codes and
    # provides conversion and convenience methods.
    class StatusCode < T::Enum
      extend T::Sig

      enums do
        # Informational
        Continue = new
        SwitchingProtocols = new
        Processing = new
        EarlyHints = new
        # Successful
        Ok = new
        Created = new
        Accepted = new
        NonAuthoritativeInformation = new
        NoContent = new
        ResetContent = new
        PartialContent = new
        # Redirection
        MultipleChoices = new
        MovedPermanently = new
        Found = new
        SeeOther = new
        NotModified = new
        TemporaryRedirect = new
        PermanentRedirect = new
        # Client Error
        BadRequest = new
        Unauthorized = new
        PaymentRequired = new
        Forbidden = new
        NotFound = new
        MethodNotAllowed = new
        NotAcceptable = new
        ProxyAuthenticationRequired = new
        RequestTimeout = new
        Conflict = new
        Gone = new
        LengthRequired = new
        PreconditionFailed = new
        ContentTooLarge = new
        URITooLong = new
        UnsupportedMediaType = new
        RangeNotSatisfied = new
        ExpectationFailed = new
        ImATeapot = new
        MisdirectedRequest = new
        UnprocessableContent = new
        Locked = new
        FailedDependency = new
        TooEarly = new
        UpgradeRequired = new
        PreconditionRequired = new
        TooManyRequests = new
        RequestHeaderFieldsTooLarge = new
        UnavailableForLegalReasons = new
        # Server Error
        InternalServerError = new
        NotImplemented = new
        BadGateway = new
        ServiceUnavailable = new
        GatewayTimeout = new
        HTTPVersionNotSupported = new
        VariantAlsoNegotiates = new
        InsufficientStorage = new
        LoopDetected = new
        NotExtended = new
        NetworkAuthenticationRequired = new
      end

      class << self
        extend T::Sig

        sig { params(int: Integer).returns(StatusCode) }
        def from_i(int)
          case int
          when 100
            Continue
          when 101
            SwitchingProtocols
          when 102
            Processing
          when 103
            EarlyHints
          when 200
            Ok
          when 201
            Created
          when 202
            Accepted
          when 203
            NonAuthoritativeInformation
          when 204
            NoContent
          when 205
            ResetContent
          when 206
            PartialContent
          when 300
            MultipleChoices
          when 301
            MovedPermanently
          when 302
            Found
          when 303
            SeeOther
          when 304
            NotModified
          when 307
            TemporaryRedirect
          when 308
            PermanentRedirect
          when 400
            BadRequest
          when 401
            Unauthorized
          when 402
            PaymentRequired
          when 403
            Forbidden
          when 404
            NotFound
          when 405
            MethodNotAllowed
          when 406
            NotAcceptable
          when 407
            ProxyAuthenticationRequired
          when 408
            RequestTimeout
          when 409
            Conflict
          when 410
            Gone
          when 411
            LengthRequired
          when 412
            PreconditionFailed
          when 413
            ContentTooLarge
          when 414
            URITooLong
          when 415
            UnsupportedMediaType
          when 416
            RangeNotSatisfied
          when 417
            ExpectationFailed
          when 418
            ImATeapot
          when 421
            MisdirectedRequest
          when 422
            UnprocessableContent
          when 423
            Locked
          when 424
            FailedDependency
          when 425
            TooEarly
          when 426
            UpgradeRequired
          when 428
            PreconditionRequired
          when 429
            TooManyRequests
          when 431
            RequestHeaderFieldsTooLarge
          when 451
            UnavailableForLegalReasons
          when 500
            InternalServerError
          when 501
            NotImplemented
          when 502
            BadGateway
          when 503
            ServiceUnavailable
          when 504
            GatewayTimeout
          when 505
            HTTPVersionNotSupported
          when 506
            VariantAlsoNegotiates
          when 507
            InsufficientStorage
          when 508
            LoopDetected
          when 510
            NotExtended
          when 511
            NetworkAuthenticationRequired
          else
            raise ArgumentError, "#{int} is not a valid HTTP status code."
          end
        end

        alias from_code from_i
      end

      sig { returns(Integer) }
      def to_i
        case self
        when Continue
          100
        when SwitchingProtocols
          101
        when Processing
          102
        when EarlyHints
          103
        when Ok
          200
        when Created
          201
        when Accepted
          202
        when NonAuthoritativeInformation
          203
        when NoContent
          204
        when ResetContent
          205
        when PartialContent
          206
        when MultipleChoices
          300
        when MovedPermanently
          301
        when Found
          302
        when SeeOther
          303
        when NotModified
          304
        when TemporaryRedirect
          307
        when PermanentRedirect
          308
        when BadRequest
          400
        when Unauthorized
          401
        when PaymentRequired
          402
        when Forbidden
          403
        when NotFound
          404
        when MethodNotAllowed
          405
        when NotAcceptable
          406
        when ProxyAuthenticationRequired
          407
        when RequestTimeout
          408
        when Conflict
          409
        when Gone
          410
        when LengthRequired
          411
        when PreconditionFailed
          412
        when ContentTooLarge
          413
        when URITooLong
          414
        when UnsupportedMediaType
          415
        when RangeNotSatisfied
          416
        when ExpectationFailed
          417
        when ImATeapot
          418
        when MisdirectedRequest
          421
        when UnprocessableContent
          422
        when Locked
          423
        when FailedDependency
          424
        when TooEarly
          425
        when UpgradeRequired
          426
        when PreconditionRequired
          428
        when TooManyRequests
          429
        when RequestHeaderFieldsTooLarge
          431
        when UnavailableForLegalReasons
          451
        when InternalServerError
          500
        when NotImplemented
          501
        when BadGateway
          502
        when ServiceUnavailable
          503
        when GatewayTimeout
          504
        when HTTPVersionNotSupported
          505
        when VariantAlsoNegotiates
          506
        when InsufficientStorage
          507
        when LoopDetected
          508
        when NotExtended
          510
        when NetworkAuthenticationRequired
          511
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
