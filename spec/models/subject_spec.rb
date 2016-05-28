require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe "parent/child lookups" do
    context "parent is assigned a child" do
      let!(:child_subject) { FactoryGirl.create(:subject, name: "test") }
      let!(:parent_subject) { FactoryGirl.create(:subject, name: "test", children: [ child_subject] ) }

      it "looks up the parent from the child" do
        expect(child_subject.parents.first).to eq(parent_subject)
      end

      it "looks up the child from the parent" do
        expect(parent_subject.children.first).to eq(child_subject)
      end
    end

    context "child is assigned a parent" do
      let!(:child_subject) { FactoryGirl.create(:subject, name: "test", parents: [ parent_subject ]) }
      let!(:parent_subject) { FactoryGirl.create(:subject, name: "test") }

      it "looks up the parent from the child" do
        expect(child_subject.parents.first).to eq(parent_subject)
      end

      it "looks up the child from the parent" do
        expect(parent_subject.children.first).to eq(child_subject)
      end
    end

    context "top level subjects" do
      let!(:parent_subject) { FactoryGirl.create(:subject, name: "test") }
      let!(:parent_subject_two) { FactoryGirl.create(:subject, name: "test 2") }
      let!(:child_subject) { FactoryGirl.create(:subject, name: "test", parents: [ parent_subject ]) }
      let!(:child_subject_two) { FactoryGirl.create(:subject, name: "test", parents: [ parent_subject_two ]) }

      it "finds only the top level subjects" do
        expect(Subject.top_level).to eq([parent_subject, parent_subject_two])
      end

      it "doesnt find child subjects" do
        expect(Subject.top_level).to_not eq([child_subject, child_subject_two])
      end
    end

    context "multiple parent/child subjects" do
      let!(:parent_subject) { FactoryGirl.create(:subject, name: "test") }
      let!(:parent_subject_two) { FactoryGirl.create(:subject, name: "test") }
      let!(:child_subject) { FactoryGirl.create(:subject, name: "test", parents: [ parent_subject, parent_subject_two ]) }
      let!(:child_subject_two) { FactoryGirl.create(:subject, name: "test", parents: [ parent_subject ]) }

      it "finds multiple parents a given child is assigned" do
        expect(child_subject.parents).to eq([parent_subject, parent_subject_two])
      end

      it "finds multiple children subjects a given parent is assigned" do
        expect(parent_subject.children).to eq([child_subject, child_subject_two])
      end
    end

    context "organisations" do
      let(:subject_one) { FactoryGirl.create(:subject) }
      let(:organisation) { FactoryGirl.create(:organisation, subjects: [ subject_one ]) }
      let(:organisation_two) { FactoryGirl.create(:organisation, subjects: [ subject_one ]) }

      it "is able to grab all organisations for a given parent subject" do
      
      end


      it "is able to grab all organisations for a given subject" do
        expect(subject_one.organisations).to eq([ organisation, organisation_two ]) 
      end
    end
  end
end
