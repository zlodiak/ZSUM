class TagnamesValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value == 'test'
      record.errors[attribute] << (options[:message] || "errorrrrrrrrrrrr")
    end
  end
end