class AddDemographicAssociationToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :city, index: true
    add_reference :users, :state, index: true
    add_reference :users, :country, index: true
  end
end
