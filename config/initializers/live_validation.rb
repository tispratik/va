LiveValidations.use :jquery_validations

# little changes for adding id column
LiveValidations::Adapters::JqueryValidations.class_eval do
  validates :uniqueness do |v, attribute|
    model = v.adapter_instance.active_record_instance
    v[:validators][attribute]['remote'] = "/live_validations/uniqueness?id=#{model.id}&model_class=#{model.class}"
    v[:messages][attribute]['remote'] = v.message_for(attribute, :taken)
  end
  
  response :uniqueness do |r|
    model_name = r.params[:model_class].downcase
    column  = r.params[model_name].keys.first
    value   = r.params[model_name][column]
    conditions = "#{column} = '#{value}'"
    conditions += " and id != #{r.params[:id]}" if r.params[:id]
    r.params[:model_class].constantize.count(:conditions => conditions) == 0
  end
end