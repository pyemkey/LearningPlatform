class AddAssociationToState < ActiveRecord::Migration
  def change
    add_reference :states, :country, index: true
  end
end
