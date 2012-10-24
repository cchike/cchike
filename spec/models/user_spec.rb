require 'spec_helper'

describe User do
  it "requires a name" do
    subject.should_not be_valid
    subject.name = "Chris Chike"
    subject.email = "cchike@seas.upenn.edu"
    subject.should be_valid
  end
end
