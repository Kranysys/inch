require 'csv'

class CsvImporter
  def initialize(file, type)
    @file = file
    @type = type
  end

  def call
    case @type
    when 'person'
      import_people
    when 'building'
      import_buildings
    else
      raise "Invalid import type: #{@type}"
    end
  end


  private

  def import_people
    CSV.foreach(@file.path, headers: true) do |row|
      person = Person.find_or_initialize_by(reference: row['reference'])
      update_person(person, row.to_hash)
    end
  end

  def update_person(person, attributes)
    special_attrs = %w[email home_phone_number mobile_phone_number address] # checking the followings attributes for Person model

    special_attrs.each do |attr|
      new_value = attributes[attr]
      next if new_value.blank? || person[attr] == new_value

      # Update only if the new value has never been a value of that field
      unless Person.where(attr => new_value).exists?
        person[attr] = new_value
      end
    end

    person.assign_attributes(attributes.except(*special_attrs))
    person.save!
  end

  def import_buildings
    CSV.foreach(@file.path, headers: true) do |row|
      building = Building.find_or_initialize_by(reference: row['reference'])
      update_building(building, row.to_hash)
    end
  end

  def update_building(building, attributes)
    new_manager_name = attributes['manager_name'] # checking the followings attributes for Building model
    if new_manager_name.present? && building.manager_name != new_manager_name 
      unless Building.where(manager_name: new_manager_name).exists?
        building.manager_name = new_manager_name
      end
    end

    building.assign_attributes(attributes.except('manager_name'))
    building.save!
  end
end
