require 'spec_helper'

describe Cloudrider::Protosite do
  before do
    @hash = {
      project_name: "craigslist inspired market",
      domain_names: ['www.craigslist-clone.com', 'craigslist-clone.com'],
      pages: [
        {
          name: :index,
          components: ["products-showcase", "product-display", "search-and-filter"]
        },
        {
          name: :products_index,
          components: ["produts-catalog", "product-listing", "search-and-filter"]
        },
        {
          name: :product_show,
          components: ["offers-overview"]
        },
        {
          name: :offers_new,
          components: []
        }
      ],
      functionalities: [:admin_panel, :user_accounts, :offerable_products, :categorizable_products],
      theme: :craigslist,
      layout: "mixed-width, hero-narrow"
    }
    @json = JSON.parse @hash.to_json
  end
  let(:protosite) { described_class.from_hash @hash }
  let(:shitsite) { described_class.from_hash @json }
  context "sanity" do
    subject { Cloudrider::Protosite }
    specify { should be_a Class }
  end
  
  context '#pages' do
    subject { protosite.pages.count }
    specify { should eq 4 }
  end

  context '#project_name' do
    subject { protosite.project_name }
    specify { should eq @hash[:project_name] }
  end

  context '#domain_names' do
    subject { protosite.domain_names }
    specify { should eq @hash[:domain_names] }
  end

  context '#project_name' do
    subject { shitsite.project_name }
    specify { should eq @hash[:project_name] }
  end

  context '#domain_names' do
    subject { shitsite.domain_names }
    specify { should eq @hash[:domain_names] }
  end
end