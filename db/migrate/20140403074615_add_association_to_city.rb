class AddAssociationToCity < ActiveRecord::Migration
  def change
    add_reference :cities, :state, index: true
    add_reference :cities, :country, index: true
  end
end
