class ApplicationController < ActionController::Base
    ACCESS_CONTROL_ALLOW_ORIGIN = '*'
    ACCESS_CONTROL_ALLOW_METHODS = 'GET, POST, PUT, DELETE, OPTIONS'
    ACCESS_CONTROL_ALLOW_HEADERS = 'accept, authorization, content-type'
    SECURE_TRANSPORT_SECURITY = 'max-age=31536000'

    before_action :set_current_user

    def allow_cors
        headers["Access-Control-Allow-Origin"] = ACCESS_CONTROL_ALLOW_ORIGIN
    
        if request.request_method == "OPTIONS"
          headers["Access-Control-Allow-Methods"] = ACCESS_CONTROL_ALLOW_METHODS
          headers["Access-Control-Allow-Headers"] = ACCESS_CONTROL_ALLOW_HEADERS
    
          head :ok
        end
      end

      def cors_preflight_check
        if request.method == 'OPTIONS'
        #   cors_set_access_control_headers
        allow_cors
          render text: '', content_type: 'text/plain'
        end
      end
    
    before_action :allow_cors
    
    def set_current_user
      if session[:user_id]
       Current.user = User.find_by(id: session[:user_id])   
      end
    end
end
