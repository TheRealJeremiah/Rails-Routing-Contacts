# == Schema Information
#
# Table name: contact_shares
#
#  id            :integer          not null, primary key
#  contact_id    :integer          not null
#  user_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_favorite :boolean          default("false"), not null
#

class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true
  validates :contact_id, uniqueness: { scope: :user_id }

  belongs_to :user,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: 'User'

  belongs_to :contact,
    foreign_key: :contact_id,
    primary_key: :id,
    class_name: 'Contact'

  has_many :comments,
    as: :commentable,
    dependent: :destroy
end
