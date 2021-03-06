class SubCategoriesController < ApplicationController
  before_action :set_sub_category, only: [:show, :edit, :update, :destroy]

  # GET /sub_categories
  def index
    @sub_categories = SubCategory.all
  end

  # GET /sub_categories/1
  def show
  end

  # GET /sub_categories/new
  def new
    @sub_category = SubCategory.new
  end

  # GET /sub_categories/1/edit
  def edit
  end

  # POST /sub_categories
  def create
    @sub_category = SubCategory.new(sub_category_params)
    @sub_category.fields = fields_params

    if @sub_category.save
      redirect_to @sub_category, notice: 'Sub category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sub_categories/1
  def update
    @sub_category.fields = fields_params
    
    if @sub_category.update(sub_category_params)
      redirect_to @sub_category, notice: 'Sub category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sub_categories/1
  def destroy
    @sub_category.destroy
    redirect_to sub_categories_url, notice: 'Sub category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_category
      @sub_category = SubCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sub_category_params
      params.require(:sub_category).permit(:category_id, :name, :slug, :fields, :title)
    end

  protected 
    def fields_params(p=params)
      if params["fields"].present? #and params["fields"].is_a?(Array)
        fields = params["fields"].map{|k,i| i}
        fields.each do |field|
          if field["values"].present?
            field["values"] = field["values"].split(',').map(&:strip)
          end
        end
      else
        []
      end
    end
end
