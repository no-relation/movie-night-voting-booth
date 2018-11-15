class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def current_user
        @current_user = User.find(session[:current_user_id])
  end
end