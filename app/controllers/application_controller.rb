class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        posts_path
    end

    # def after_sign_in_path_for(_resource_or_scope)
    #     new_user_session_path
    # end

    def authorize_request(kind = nil)
        unless kind.include?(current_user.role)
        redirect_to posts_path, notice: "You are not authorized to perform this action"
        end
    end
    
end
