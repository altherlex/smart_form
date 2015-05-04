module SmartFormHelper
  def mount_form_fields(params={})
    return "" if params.empty?
    #params = params.with_indifferent_access
    case params[:type].to_sym
      when :text
        text_field_tag(name_2_variable(params[:title]), params[:value])
      when :select
        #options = options_from_collection_for_select(@people, "id", "name", "1")
        select_tag(name_2_variable(params[:title]), options_for_select(params[:values]), include_blank: true)
      when :checkbox
        params[:values].map do |value|
          check_box_tag( name_2_variable(params[:title]), value, false, class: name_2_variable(params[:title]) )+value
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
