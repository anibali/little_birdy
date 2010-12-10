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
  
  describe ".sanitize" do
    it "should not affect valid filenames" do
      File.sanitize("valid_name").should == "valid_name"
    end
    
    it "should replace reserved characters" do
      File.sanitize("up/down").should == "up_down"
    end
    
    it "should allow custom replacement strings" do
      File.sanitize("foo:bar?", "-").should == "foo-bar-"
    end
  end
end

