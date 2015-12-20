module Aric
  module Error
    class JobNameRequired < StandardError
      def to_s
        'Job name required, But not pass job name'
      end
    end
  end
end
