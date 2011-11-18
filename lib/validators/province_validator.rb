
class ProvinceValidator < ActiveModel::EachValidator
  def validate_each(record,attribute,value)
    begin
      r = Person::PROVINCES[record[:country]].include? value
    rescue Exception => e  
      r = false
    end
    record.errors[attribute] << (options[:message] || "#{value} is an invalid province or state") unless r
  end
end