class CreateInitialDb < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :members do |t|
      t.belongs_to :pool, index: true
      t.string :name
      t.timestamps null: false
    end

    create_table :balance_record do |t|
      t.belongs_to :pool, index: true
      t.belongs_to :member, index: true
      t.float :amount
      t.timestamps null: false
    end

    create_table :deposits do |t|
      t.belongs_to :pool, index: true
      t.belongs_to :member, index: true
      t.float :amount
      t.timestamps null: false
    end

    create_table :withdrawals do |t|
      t.belongs_to :pool, index: true
      t.belongs_to :member, index: true
      t.float :amount
      t.timestamps null: false
    end
  end
end
