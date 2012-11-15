class UserCell < Cell::Rails
  helper ApplicationHelper
  include Devise::Controllers::Helpers
  helper_method :current_user

  def index
    @users = User.all
    render
  end

end
