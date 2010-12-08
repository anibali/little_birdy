require 'spec_helper'
require 'little_birdy/string'

describe String do
  describe "#gsub" do
    it "should do nothing when passed an empty hash" do
      str = "Hello"
      str.gsub({}).should == str
    end
    
    it "should permit ordinary usage of gsub" do
      "Hello".gsub("l", "r").should == "Herro"
    end
    
    it "should perform substitutions according to the passed hash" do
      "Ha1y Birth2".gsub('1' => 'pp', '2' => 'day').should == "Happy Birthday"
    end
    
    it "should escape string keys in hash" do
      "a.c".gsub('.' => 'b').should == 'abc'
    end
    
    it "should handle regular expression keys in hash" do
      "a.c".gsub(/./ => 'b').should == 'bbb'
    end
  end
  
  describe "#gsub!" do
    it "should modify the string in place" do
      str = "Ha1y Birth2"
      str.gsub!('1' => 'pp', '2' => 'day').should == "Happy Birthday"
      str.should == "Happy Birthday"
    end
  end
  
  describe "#ellipsize" do
    it "should do nothing for short strings" do
      str = "Acid"
      str.ellipsize(20).should == str
    end
    
    it "should truncate long strings" do
      str = "I really don't mind if you sit this one out."
      str.ellipsize(20).size.should < str.size
    end
    
    it "should accept custom ellipsis strings" do
      str = "Nothing can stop me now."
      str.ellipsize(10, "%").should include("%")
    end
  end
  
  describe "#ellipsize!" do
    it "should modify the string in place" do
      str = "Are you talking to me?"
      old_str = str.dup
      str.ellipsize!(10)
      str.should_not == old_str
    end
  end
  
  describe "#starts_with?" do
    it "should evaluate to true when the string starts with the argument" do
      "Hello".starts_with?("Hell").should be_true
    end
    
    it "should evaluate to false when the string does not start with the argument" do
      "Hello".starts_with?("Hi").should be_false
    end
  end
  
  describe "#ends_with?" do
    it "should evaluate to true when the string ends with the argument" do
      "Hello".ends_with?("llo").should be_true
    end
    
    it "should evaluate to false when the string does not end with the argument" do
      "Hello".ends_with?("Hell").should be_false
    end
  end
end

