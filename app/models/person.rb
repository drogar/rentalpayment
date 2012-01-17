class Person < ActiveRecord::Base
  
  COUNTRIES = ['Canada', 'U.S.A.', 'Mexico']
  PROVINCES = {'Canada' => ['Alberta', 'B.C.', 'Saskatchewan'], 
    'U.S.A.' => ['Washington', 'Idaho', 'Montana'], 
    'Mexico' => ['D.F.']}
    
  belongs_to :salutation
  
  validates :province_or_state, province: true
  
  validates :email, :first_name, :last_name, :city, :postal_code, presence: true
  
  validates :country, inclusion: COUNTRIES
  
  validates :email, email:  true
  
  has_many :properties
  
  def display_name 
    "#{first_name} #{last_name}"
  end
  
end
