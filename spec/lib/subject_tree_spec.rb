require "rails_helper"

RSpec.describe SubjectTree do
  let(:sub) { instance_double(Subject) }
  subject {  SubjectTree.new(sub) }

  context "shallow iteration" do
    let(:child_one) { instance_double(Subject) }
    let(:child_two) { instance_double(Subject) }
    let(:parent_one) { instance_double(Subject) }
    let(:parent_two) { instance_double(Subject) }

    it "gets all the children for a given subject" do
      expect(sub).to receive(:children).and_return([child_one, child_two])
      expect(subject.children(deep: false)).to eq([child_one, child_two])
    end

    it "gets all the parent children for a given subject" do
      expect(sub).to receive(:parents).and_return([parent_one, parent_two])
      expect(subject.parents(deep: false)).to eq([parent_one, parent_two])
    end
  end

  context "deep iteration" do
    let(:child_one) { instance_double(Subject, "child one") }
    let(:child_two) { instance_double(Subject, "child two") }
    let(:child_three) { instance_double(Subject, "child three") }
    let(:child_four) { instance_double(Subject, "child four") }
    let(:parent_one) { instance_double(Subject, "parent one") }
    let(:parent_two) { instance_double(Subject, "parent two") }
    let(:parent_three) { instance_double(Subject, "parent three") }

    it "gets all the children for a given subject two levels deep" do
      allow(sub).to receive(:children).and_return([child_one, child_two])
      allow(child_one).to receive(:children).and_return([child_three])
      allow(child_two).to receive(:children).and_return([child_four])
      allow(child_three).to receive(:children).and_return([])
      allow(child_four).to receive(:children).and_return([])
      expect(subject.children(deep: true)).to eq([child_three, child_four, child_one, child_two])
    end

    it "gets all the parents for a given subject two levels deep" do
      allow(sub).to receive(:parents).and_return([parent_one, parent_two])
      allow(parent_one).to receive(:parents).and_return([parent_three])
      allow(parent_two).to receive(:parents).and_return([])
      allow(parent_three).to receive(:parents).and_return([])
      expect(subject.parents(deep: true)).to eq([parent_three, parent_one, parent_two])
    end
  end
end

