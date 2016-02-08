- pools
  - name
  = balance | (sum of all members balances)

- members
  - pool_id
  - name
  = balance | (summed deposits) - (summed withdrawals)
  = points | (sum of all past balance_records) + (member's current balance)

- balance_record
  - pool_id
  - member_id
  - amount
  - timestamp

- deposits
  - pool_id
  - member_id
  - amount
  - timestamp

- withdrawals
  - pool_id
  - member_id
  - amount
  - timestamp
