module SmartFormHelper
  def mount_form_fields(params={})
    return "" if params.empty?
    #params = params.with_indifferent_access
    case params[:type].to_sym
      when :text
        content_tag(:label, params[:title])+
        text_field_tag(name_2_variable(params[:title]), params[:value], class:'form-control')
      when :textarea
        content_tag(:label, params[:title])+
        text_area_tag(name_2_variable(params[:title]), params[:value], class:'form-control')
      when :select
        content_tag(:label, params[:title])+
        select_tag(name_2_variable(params[:title]), options_for_select(params[:values]), include_blank:true, class:'form-control')
      when :checkbox
        params[:values].map.with_index do |value, index|
          check_box_tag( name_2_variable(params[:title])+'['+index.to_s+']', value, false, class: name_2_variable(params[:title])+" form-control" )+value
        end.join('<br/>')
    #else
    end

  end
  def name_2_variable(str)
    ActiveSupport::Inflector
      .transliterate(str.to_s)
      .downcase
      .gsub(' ', '-')
      .gsub(/(\?|!|\.)/, "")
  end
end
