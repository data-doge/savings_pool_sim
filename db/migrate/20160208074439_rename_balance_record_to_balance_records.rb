class RenameBalanceRecordToBalanceRecords < ActiveRecord::Migration
  def change
    rename_table :balance_record, :balance_records
  end
end
