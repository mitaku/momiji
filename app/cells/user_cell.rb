class UserCell < Cell::Rails
  include CellsHelperMethods

  def index
    @users = target_company.users
    render
  end

end
