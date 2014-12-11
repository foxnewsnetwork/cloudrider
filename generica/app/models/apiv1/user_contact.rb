# == Schema Information
#
# Table name: apiv1_user_contacts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  phone      :string(255)
#  email      :string(255)
#  address    :string(255)
#  status     :string(255)
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Apiv1::UserContact < ActiveRecord::Base
  KnownStatuses = ['primary']
  acts_as_paranoid
  belongs_to :user,
    class_name: 'Admin::User'

  scope :is_primary,
    -> { where "#{self.table_name}.status" => 'primary' }

  validates :user,
    presence: true

  def make_primary!
    return if user.primary_contact == self
    user.primary_contact.try :demote_to_secondary!
    update status: 'primary'
  end

  def demote_to_secondary!
    update status: nil
  end

  def to_user_hash
    {
      email: email,
      company_name: name,
      phone_number: phone,
      address: address
    }
  end

  def to_ember_hash
    attributes
  end
end
