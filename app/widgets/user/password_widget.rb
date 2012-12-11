class User::PasswordWidget < Apotomo::Widget
  include CellsHelperMethods

  responds_to_event :submit, :with => :process_password

  def display(user)
    @user ||= target_company.users.find(user.id)
    render
  end

  def process_password(event)
    @user = target_company.users.find(event[:user_password_widget].delete(:id))
    if @user.update_attributes(event[:user_password_widget])
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true if user == current_user
      replace({:state => :display}, @user)
    else
      replace :view => :display
    end
  end

end
