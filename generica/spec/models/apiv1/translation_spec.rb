require 'rails_helper'

describe Apiv1::Translation do
  let(:translation) { described_class.new @translation_params }
  before do
    @translation_params = {
      locale: "en",
      key: "dogs_are_neat",
      translated_text: "dogs are neat"
    }
  end
  context '#new' do
    subject { -> { translation.save! } }
    specify { should change(Apiv1::Translation, :count).by 1 }
  end
  context 'validity' do
    before { translation.valid? }
    subject { translation.errors }
    specify { should be_blank }
  end
  context 'aliasing' do
    before { translation.save! }
    subject { translation.translated_text }
    specify { should eq @translation_params[:translated_text] }
    specify { should eq translation.value }
  end
end