require 'spec_helper'
require 'little_birdy/file'

describe File do
  describe ".dirname" do
    it "should permit ordinary usage of dirname" do
      File.dirname("/home/timmy/.irbrc").should == "/home/timmy"
    end
    
    it "should be able to find the nth parent" do
      File.dirname("/foo/bar/baz", 2).should == "/foo"
    end
  end
end

