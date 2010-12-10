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
    # @param [String] file_name the file path to begin traversal from.
    # @param [Integer] n the number of levels to ascend.
    # @return [String] the file's nth parent.
    def dirname file_name, n=1
      n.times { file_name = _old_dirname(file_name) }
      return file_name
    end
  end
end

