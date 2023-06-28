# typed: strict
# frozen_string_literal: true

module Typed
  module HTTP
    # Enumerates all valid request header methods.
    class Method < T::Enum
      enums do
        Connect = new("CONNECT")
        Delete = new("DELETE")
        Get = new("GET")
        Head = new("HEAD")
        Options = new("OPTIONS")
        Patch = new("PATCH")
        Post = new("POST")
        Put = new("PUT")
        Trace = new("TRACE")
      end
    end
  end
end
