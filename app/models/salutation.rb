class Salutation < ActiveRecord::Base
  has_many :people
  before_destroy :ensure_not_referenced_by_any_person
  
  def self.salutations_for_select(lang='en')
    Salutation.find_all_by_language(lang).collect {|s| [s.salutation, s.id] }
  end
  
  private

   def ensure_not_referenced_by_any_person
     
    return true if people.empty?
    errors.add(:base, 'People are using this salutation')
    return false
   end
end
