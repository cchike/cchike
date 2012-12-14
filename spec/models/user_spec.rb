require 'spec_helper'

describe User do
  it "requires an e-mail" do
    subject.should_not be_valid
    subject.email = "cchike@seas.upenn.edu"
    subject.password = 'test1234'
    subject.password_confirmation = 'test1234'
    subject.should be_valid
  end
end
