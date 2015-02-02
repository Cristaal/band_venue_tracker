class AddTimestampToBandsVenues < ActiveRecord::Migration
  def change
    add_column(:bands_venues, :created_at, :datetime)
    add_column(:bands_venues, :updated_at, :datetime)
  end
end
