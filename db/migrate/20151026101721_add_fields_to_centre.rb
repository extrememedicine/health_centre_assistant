class AddFieldsToCentre < ActiveRecord::Migration
  def change
    add_column :centres, :name, :string
    add_column :centres, :location, :string
    add_column :centres, :description, :text
    add_column :centres, :status, :string
    add_column :centres, :key_contacts, :text
    add_column :centres, :assistant_contacts, :text

    add_column :centres, :medical, :text
    add_column :centres, :medical_level, :integer

    add_column :centres, :equiptment, :text
    add_column :centres, :equiptment_level, :integer

    add_column :centres, :people, :text
    add_column :centres, :people_level, :integer

    add_column :centres, :food, :text
    add_column :centres, :food_level, :integer

    add_column :centres, :other, :text

  end

end
