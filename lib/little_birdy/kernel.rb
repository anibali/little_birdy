module Kernel
  # Converts arg to a Symbol.
  #
  # @example Convert a String into a Symbol
  #   Symbol("hello") #=> :hello
  #
  # @param [Object] arg the object to convert to a Symbol.
  # @return [Symbol] the result of conversion.
  def Symbol(arg)
    if arg.respond_to? :to_sym
      arg.to_sym
    else
      raise TypeError.new("can't convert #{arg.class} into Symbol")
    end
  end
  
  # Attempts to use Kernel#require to load a library. Instead of raising a
  # LoadError if the library is not found, try_require returns false. If
  # the library is loaded successfully or has been loaded previously,
  # try_require returns true.
  #
  # @example Handle the absence of a library
  #   unless try_require 'some_library'
  #     $stderr.puts "Please install 'some_library'"
  #   end
  #
  # @param [Object] *args the arguments to send Kernel#require.
  # @return [Boolean] true if the library is loaded, false otherwise.
  def try_require *args
    begin
      require *args
      return true
    rescue LoadError
      return false
    end
  end
end

