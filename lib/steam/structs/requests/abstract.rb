module Steam
  module Struct
    module Requests
      class Abstract < Steam::Structs::Base
        def version
          raise NotImplementedError, 'Override this method'
        end

        def path
          raise NotImplementedError, 'Override this method'
        end

        def method
          :get
        end

        def body
          as_json.deep_symbolize_keys
        end

        def needs_authorization?
          true
        end
      end
    end
  end
end
