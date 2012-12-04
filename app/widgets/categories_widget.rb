class CategoriesWidget < Apotomo::Widget
  responds_to_event :search

  include CellsHelperMethods

  DEFAULT_PER = 10

  has_scope :page, :default => 1
  has_scope :per, :default => DEFAULT_PER

  has_scope :q do |controller, scope, value|
    (value || "").split(space_regex).inject(scope) do |relation, word|
      word = escape_wildcard(word)
      relation.where("name like ?", "%#{word}%")
    end
  end

  def index(_params = {})
    _params ||= {}
    @search_params ||= {}
    @categories = apply_scopes(target_company.user_categories, @search_params.merge!(_params.symbolize_keys))
    @search = OpenStruct.new(@search_params)
    render
  end

  def search(event)
    @search_params = event.data.to_hash.symbolize_keys[:search] || {}
    update :state => :index
  end

  private
    def self.space_regex
      Regexp.new("[\s\u3000]+")
    end

    def self.escape_wildcard(word)
      word.to_s.gsub(/[_%\\]/){"\\#{$&}"}
    end

end
