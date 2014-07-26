class ClientLocation < ActiveRecord::Base
  def address
    [address_line_1, address_line_2, state, city, zip_code].compact.join(', ')
  end

  geocoded_by :address
  after_validation :geocode
  belongs_to :client
  has_many :jobs
end
