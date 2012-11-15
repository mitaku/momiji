class UserCell < Cell::Rails
  include CellsHelperMethods

  def index
    @users = User.all
    render
  end

end
