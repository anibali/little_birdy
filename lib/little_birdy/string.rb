class String
  # Truncates a string by replacing central characters with an ellipsis.
  #
  # @param [Integer] len the number of characters to keep from the original string.
  # @param [String] ellipsis a string representing the ellipsis to insert.
  # @return [String] the truncated string.
  def ellipsize len, ellipsis="…"
    if length > len
      "#{self[0..(len/2.0).ceil]}#{ellipsis}#{self[-len/2..-1]}"
    else
      self
    end
  end
  
  # Performs String#ellipsize in place.
  def ellipsize! *args
    replace(ellipsize *args)
  end
  
  # Verifies that the string starts with the specified prefix.
  #
  # @param [String] prefix the prefix string to test.
  # @return [Boolean] true if the string starts with the specified prefix.
  def starts_with? prefix
    self[0...prefix.length] == prefix
  end
  
  # Verifies that the string ends with the specified suffix.
  #
  # @param [String] suffix the suffix string to test.
  # @return [Boolean] true if the string ends with the specified suffix.
  def ends_with? suffix
    self[-suffix.length..-1] == suffix
  end
  
  alias :_old_gsub :gsub
  alias :_old_gsub! :gsub!
  
  # Behaves the same as String#gsub from the standard library, except when
  # passed a hash. In this case, each substring matching a key in the hash is
  # replaced with the associated value. String keys are matched exactly
  # (they do not behave like regular expressions).
  #
  # @example Substitute parts of a string
  #   ".1a2a".gsub '.' => 'F', /.a/ => 'o' #=> "Foo"
  def gsub *args, &block
    _little_birdy_gsub method(:_old_gsub), *args, &block
  end
  
  # Performs String#gsub in place.
  def gsub! *args, &block
    _little_birdy_gsub method(:_old_gsub!), *args, &block
  end
  
  private
  def _little_birdy_gsub gsub_method, *args, &block
    if args.one? and args[0].is_a? Hash and not block_given?
      hash = args[0]
      keys = hash.keys.map { |k| k.is_a?(Regexp) ? k : Regexp.escape(k)}
      gsub_method.call /(#{keys.join("|")})/ do |match|
        replacement = nil
        hash.each do |r, v|
          if match == r or (r.is_a?(Regexp) and match.match(r))
            replacement = v
            break
          end
        end
        replacement
      end
    else
      gsub_method.call *args, &block
    end
  end
end

