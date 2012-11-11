class UserCell < Cell::Rails
  helper ApplicationHelper

  def index
    p params
    @users = User.all
    render
  end

end
