class Sidebar::UserWidget < Sidebar::BaseWidget
  set_pagination

  has_scope :q do |controller, scope, value|
    (value || "").split(space_regex).inject(scope) do |relation, word|
      word = escape_wildcard(word)
      relation.where("name like ?", "%#{word}%")
    end
  end

  private
    def get_objects
      target_company.users
    end

end
