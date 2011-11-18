class AddSalutationIdToPeople < ActiveRecord::Migration
  def up
    add_column :people, :salutation_id, :integer
    Person.all.each do |person|
      if person.salutation
        sal = Salutation.find_by_salutation(person.salutation)
        if sal
          person.salutation_id = sal.id
        else
          newsal = Salutation.new()
          newsal.salutation = person.salutation
          newsal.language = 'en'
          newsal.order = 001
          newsal.save
        end
      else
        person.salutation_id = Salutation.find_by_salutation('Mr.').id
      end
      person.save
    end
    remove_column :people, :salutation
  end
  
  def down
    add_column :people, :salutation, :string
    Person.all.each do |person|
      person.salutation = Salutation.find_by_id(person.salutation_id)
    end
    remove_column :people, :salutation_id
  end
end
