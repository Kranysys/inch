require 'rails_helper'

RSpec.describe CsvImporter, type: :service do
  # TESTING PERSONS IMPORT
  describe 'importing persons from CSV' do
    it 'correctly imports data into the Person model' do
      # Assuming Persons.csv is in spec/fixtures
      file = fixture_file_upload('Persons.csv', 'text/csv')

      expect {
        CsvImporter.new(file, 'person').call
      }.to change(Person, :count).by(4)
    end
  end

  # TESTING BUILDINGS IMPORT 
  describe 'importing buildings from CSV' do
    it 'correctly imports data into the Building model' do
      file = fixture_file_upload('Buildings.csv', 'text/csv')
  
      expect {
        CsvImporter.new(file, 'building').call
      }.to change(Building, :count).by(7)
    end
  end
end
