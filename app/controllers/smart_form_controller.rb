class SmartFormController < ApplicationController
  # GET /:slug_categoria/:slug_subcategoria
  def show
    @sub_category = SubCategory.find_smart_form(params[:slug_categoria], params[:slug_subcategoria]).try(:first)
  end
  def index
    @sub_categories = SubCategory.all
  end
end
