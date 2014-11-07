# == Schema Information
#
# Table name: apiv1_messages
#
#  id           :integer          not null, primary key
#  from_company :string(255)
#  sender_email :string(255)
#  subject_text :string(255)
#  message      :text
#  created_at   :datetime
#  updated_at   :datetime
#

class Apiv1::Message < ActiveRecord::Base
  validates :from_company,
    :sender_email,
    :subject_text,
    :message,
    presence: true

  def to_ember_hash
    attributes
  end
end
