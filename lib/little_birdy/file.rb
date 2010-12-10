class File
  class << self
    alias :_old_dirname :dirname
    
    # Behaves the same as File.dirname from the standard library, except when
    # passed a second argument, n. In this case, dirname is called n times,
    # essentially finding the file's nth parent.
    #
    # @example Find a file's grandparent
    #   File.dirname("/foo/bar/baz", 2) #=> "/foo"
    #
    # @param [String] file_name the filename to begin traversal from.
    # @param [Integer] n the number of levels to ascend.
    # @return [String] the file's nth parent.
    def dirname file_name, n=1
      n.times { file_name = _old_dirname(file_name) }
      return file_name
    end
    
    # Converts a string into a valid file name by replacing reserved
    # characters.
    #
    # @example Sanitize a filename
    #   File.sanitize("foo/bar?") #=> "foo_bar_"
    #   File.sanitize("foo/bar?", "X") #=> "fooXbarX"
    #
    # @param [String] file_name the filename to sanitize.
    # @param [String] replacement the string which replaces reserved characters.
    # @return [String] the sanitized filename.
    def sanitize(file_name, replacement="_")
      # See http://en.wikipedia.org/wiki/Filename#Reserved_characters_and_words
      return file_name.gsub(/[\/|\0|\\\?%\*:"<>]/, replacement)
    end
  end
end

