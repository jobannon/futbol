require 'csv'

class Collection
  attr_reader :all

  def initialize(csv_path)
    @all = create_collection(csv_path)
  end

  def create_collection(csv_path)
    csv = CSV.read("#{csv_path}", headers: true, header_converters: :symbol)
    csv.map {|row| new_object(row)}
  end
end
