Object.class_eval do
  def _?
    self
  end
end

NilClass.class_eval do
  def _?
    SafeNilClass.new
  end
end

class SafeNilClass
  def method_missing(*args, &b)
    nil.send(*args, &b) rescue nil
  end
end

