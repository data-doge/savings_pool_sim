class Pool < ActiveRecord::Base
  has_many :members, dependent: :destroy
end
