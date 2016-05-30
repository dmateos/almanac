require "rails_helper"

RSpec.describe SearchService do
  let(:search_interface) { class_double(Organisation) }
  subject { SearchService.new(search_interface) }

  context "simple query" do
    let(:query_string) { {:query=>{:query_string=>{:query=>"*test org*"}}} }
    let(:record_results) { double() }
    let(:record) { double() }

    it "searches and finds results based on a simple query" do
      expect(record_results).to receive(:records).and_return([record])
      expect(search_interface).to receive(:search).with(query_string).and_return(record_results)

      expect(subject.search("test org")).to eq([record]) 
    end
  end

  context "category based query" do
    it "searches and finds results with a category tag limitation" do
      #expect(subject.search("test org", tag: :test_tag)).to eq("something")
    end
  end
end
