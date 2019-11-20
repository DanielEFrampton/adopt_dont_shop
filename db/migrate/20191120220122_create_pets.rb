class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :sex
      t.string :image_path
      t.string :approx_age
      t.references :shelter, foreign_key: true
    end
  end
end
