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
      raise 'Invalid CSV type'
    end
  end

  private

  def import_people
    CSV.foreach(@file.path, headers: true) do |row|
      Person.create!(row.to_hash)
    end
  end

  def import_buildings
    CSV.foreach(@file.path, headers: true) do |row|
      Building.create!(row.to_hash)
    end
  end
end
