class UserCategoriesController < CategoriesController

  private
  def set_categories
    @categories = target_company.user_categories
  end

  def set_category
    @category = target_company.user_categories.find(params[:id])
  end

  def new_category(attributes = {})
    @category = target_company.user_categories.new(attributes)
  end
end
