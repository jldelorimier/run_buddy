class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.bigint :run1
      t.bigint :run2

      t.timestamps
    end
  end
end
