require 'spec_helper'

describe Object do
  describe "#instance_exec" do
    it "should not change if it is already defined" do
      # Define instance_exec
      Object.class_eval do
        def instance_exec
          "unchanged"
        end
      end
      
      load 'little_birdy/ensure_exec.rb'
      
      Object.new.instance_exec.should == 'unchanged'
    end
    
    it "should be added if it is not defined" do
      # Undefine instance_exec
      if Object.new.respond_to?(:instance_exec)
        Object.class_eval do
          undef instance_exec
        end
      end
      
      load 'little_birdy/ensure_exec.rb'
      
      str = ''
      str.should respond_to :instance_exec
      str.instance_exec 'hello' do |message|
        replace message
      end
      str.should == 'hello'
    end
  end
end

describe Module do
  describe "#module_exec" do
    it "should not change if it is already defined" do
      # Define instance_exec
      Module.class_eval do
        def module_exec
          "unchanged"
        end
      end
      
      load 'little_birdy/ensure_exec.rb'
      
      Module.new.module_exec.should == 'unchanged'
    end
    
    it "should be added if it is not defined" do
      # Undefine instance_exec
      if Module.respond_to?(:module_exec)
        Module.class_eval do
          undef module_exec
        end
      end
      
      load 'little_birdy/ensure_exec.rb'
      
      Module.should respond_to :module_exec
      String.module_exec '!!!' do |mark|
        send :define_method, 'exclaim' do
          self + mark
        end
      end
      "Hello".exclaim.should == 'Hello!!!'
    end
  end
end

