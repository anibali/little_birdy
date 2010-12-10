require 'spec_helper'
require 'little_birdy/kernel'

describe Kernel do
  describe "#Symbol" do
    it "should be able to convert Strings" do
      Symbol("apple").should == :apple
    end
    
    it "should leave Symbols unchanged" do
      Symbol(:birthday).should == :birthday
    end
    
    it "should raise a TypeError for unsupported types" do
      expect { Symbol([]) }.to raise_exception(TypeError)
    end
  end
  
  describe "#try_require" do
    it "should return false when a library is missing" do
      try_require('_no_such_library_').should be_false
    end
    
    it "should return true when a library has been loaded previously" do
      require 'little_birdy'
      try_require('little_birdy').should be_true
    end
    
    it "should return true when a library successfully loads" do
      $".delete 'little_birdy.rb'
      try_require('little_birdy').should be_true
    end
  end
end

