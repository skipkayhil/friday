# frozen_string_literal: true

module Friday
  class Host
    # A repository host running Gitlab
    class Gitlab < Host
      PROVIDER = "gitlab"
      DEFAULT_DOMAIN = "gitlab.com"

      def endpoint
        "https://#{domain}/api/v4"
      end
    end
  end
end
