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
end

