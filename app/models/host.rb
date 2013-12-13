# == Schema Information
#
# Table name: hosts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  state      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Host < ActiveRecord::Base
  has_many :stories

  state_machine initial: :new do
    state :published, :blocked

    event :publish do
      transition blocked: :published
      transition new: :published
    end

    event :block do
      transition published: :blocked
      transition new: :blocked
    end
  end
end
