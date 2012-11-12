require "spec_helper"

describe Notifications do
  describe "new_order" do
    let(:mail) { Notifications.new_order }

    it "renders the headers" do
      mail.subject.should eq("New order")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
