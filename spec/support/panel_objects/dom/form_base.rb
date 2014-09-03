module Dom
  module FormBase
    ERROR_EXPLANATION_ID = '#error_explanation'

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def instance
        first
      end
    end

    def errors
      within(id) do
        if node.has_css? ERROR_EXPLANATION_ID
          Array(node.find("#{ERROR_EXPLANATION_ID} ul li")).map &:text
        else
          []
        end
      end
    end
  end
end
