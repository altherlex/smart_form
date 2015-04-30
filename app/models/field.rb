class Field
  attr_accessor :order, :title, :type, :values
  def initialize(attr={})
    @order = attr[:order]
    @title = attr[:title]
    @type = attr[:type]
    @values = attr[:values]
  end
  
  def as_json_with_indifferent_access
    self.as_json_without_indifferent_access.with_indifferent_access
  end
  alias_method_chain :as_json, :indifferent_access
  alias_method :to_into, :as_json_with_indifferent_access
end