class ImportController < ApplicationController
  def new
    # This action will render the new.html.erb view automatically
  end

  def create
    CsvImporter.new(params[:file], params[:type]).call
    redirect_to root_path, notice: 'CSV imported successfully'
  rescue => e
    redirect_to import_new_path, alert: "Failed to import CSV: #{e.message}"
  end
end
