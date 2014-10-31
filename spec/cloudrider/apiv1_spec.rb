require 'spec_helper'

describe Cloudrider::Apiv1 do
  context ':file_name_from_class_name' do
    subject { Cloudrider::Apiv1.file_name_from_class_name "Cloudrider::Apiv1::DonkeyPunchSass" }
    specify { should eq "_donkey-punch" }
  end
  context ':file_name_from_class_name' do
    subject { Cloudrider::Apiv1.file_name_from_class_name "Cloudrider::Apiv1::PearlNecklaceComponent" }
    specify { should eq "pearl-necklace" }
  end
  context ':file_ext_from_class_name' do
    subject { Cloudrider::Apiv1.file_ext_from_class_name "Cloudrider::Apiv1::ApplicationComponent" }
    specify { should eq ".emblem" }
  end
  context ':file_ext_from_class_name' do
    subject { Cloudrider::Apiv1.file_ext_from_class_name "Cloudrider::Apiv1::DicksAreUsSass" }
    specify { should eq ".css.scss" }
  end
end