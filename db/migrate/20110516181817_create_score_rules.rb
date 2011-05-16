class CreateScoreRules < ActiveRecord::Migration
  def self.up
    create_table :score_rules do |t|
      t.string  :name
      t.integer :score
      t.integer :score_type
      t.decimal :exponent, :default => 1
      t.integer :controller_id

      t.timestamps
    end

    add_index :score_rules, :controller_id
    add_index :score_rules, :score_type
  end

  def self.down
    remove_index :score_rules, :controller_id
    remove_index :score_rules, :score_type
    drop_table :score_rules
  end
end
