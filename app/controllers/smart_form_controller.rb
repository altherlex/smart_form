class SmartFormController < ApplicationController
  # GET /:slug_categoria/:slug_subcategoria
  def show
    @sub_category = SubCategory.first_smart_form(params[:slug_categoria], params[:slug_subcategoria])
  end
end
