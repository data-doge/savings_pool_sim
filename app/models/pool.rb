class Pool < ActiveRecord::Base
  has_many :members, dependent: :destroy

  def balance
    members.map { |member| member.balance }.reduce(:+) || 0
  end
end
