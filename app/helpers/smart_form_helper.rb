module SmartFormHelper
  def mount_form_fields(params={})
    return "" if params.empty?
    params = params.with_indifferent_access
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
        if params[:values].present?
          params[:values].map.with_index do |value, index|
            content_tag(:div, class:'form-group') do
              content_tag(:div, class:'checkbox') do
                content_tag(:label) do
                  check_box_tag( name_2_variable(params[:title])+'['+index.to_s+']', value, false, class: name_2_variable(params[:title])+" form-control", style:"width: 15px;" )+value
                end
              end
            end
          end.join('').html_safe
        end
      when :radio
        if params[:values].present?
          params[:values].map.with_index do |value, index|
            content_tag(:div, class:'form-group') do
              content_tag(:div, class:'radio') do
                content_tag(:label) do
                  radio_button_tag( name_2_variable(params[:title]), value, false, class: name_2_variable(params[:title])+" form-control", style:"width: 15px;" )+value
                end
              end
            end
          end.join('').html_safe
        end        
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
