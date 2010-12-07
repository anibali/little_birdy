require 'spec_helper'
require 'little_birdy/safe_navigation'

describe "Safe navigation with #_?" do
  it "should return nil when subject is nil" do
    nil._?.join.should be_nil
  end
  
  it "should delegate method when subject is non-nil" do
    ['a', 'b']._?.join.should == 'ab'
  end
end

