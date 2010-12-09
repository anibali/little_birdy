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
end

