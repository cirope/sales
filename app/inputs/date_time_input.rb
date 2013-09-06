class DateTimeInput < SimpleForm::Inputs::Base
  def input
    @builder.datetime_field(attribute_name, input_html_options)
  end
end
