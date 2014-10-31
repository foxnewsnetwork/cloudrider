require 'spec_helper'

class Cloudrider::Apiv1::TestApplicationComponent < Cloudrider::Apiv1::Base; end
class Cloudrider::Apiv1::TestApplicationSass < Cloudrider::Apiv1::Base; end
class Cloudrider::Apiv1::TestApplicationEmblem < Cloudrider::Apiv1::Base; end
describe Cloudrider::Apiv1::Base do
  let(:component) { Cloudrider::Apiv1::TestApplicationComponent.new }
  let(:sass) { Cloudrider::Apiv1::TestApplicationSass.new }
  let(:emblem) { Cloudrider::Apiv1::TestApplicationEmblem.new }
  context '#_source_file' do
    subject { component.send :_source_file }
    specify { should eq "test-application.emblem.erb" }
  end
  context '#_source_file' do
    subject { sass.send :_source_file }
    specify { should eq "_test-application.css.scss.erb" }
  end
  context '#_source_file' do
    subject { emblem.send :_source_file }
    specify { should eq "test_application.emblem.erb" }
  end
  context '#_file_name' do
    subject { component.send :_file_name }
    specify { should eq "test-application.emblem" }
  end
  context '#_file_name' do
    subject { sass.send :_file_name }
    specify { should eq "_test-application.css.scss" }
  end
  context '#_file_name' do
    subject { emblem.send :_file_name }
    specify { should eq "test_application.emblem" }
  end
  context '#_family' do
    subject { emblem.send :_family }
    specify { should eq :emblem }
  end
  context '#_family' do
    subject { sass.send :_family }
    specify { should eq :sass }
  end
  context '#_family' do
    subject { component.send :_family }
    specify { should eq :component }
  end
end