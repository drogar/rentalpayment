class Salutation < ActiveRecord::Base
  has_many :people
  before_destroy :ensure_not_referenced_by_any_person

  LANGUAGES = ['en', 'fr', 'es']
  
  validates :salutation, presence: true
  validates :language, inclusion: Salutation::LANGUAGES
  validates :display_order, numericality: {greater_than_or_equal_to: 1}
  
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
