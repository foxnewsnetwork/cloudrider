require 'rails_helper'

RSpec.describe Apiv1::Message, :type => :model do
  let(:message) { Apiv1::Message.new @message_params }
  before { @message_params = { from_company: ""} }
  context 'validation' do
    subject { message }
    specify { should_not be_valid }
  end
  context 'errors' do
    let(:expected) { { from_company: "can't be blank", sender_email: "can't be blank", subject_text: "can't be blank", message: "can't be blank" } }
    before { message.valid? }
    subject { message.errors.to_h }
    specify { should eq expected }
  end
end
