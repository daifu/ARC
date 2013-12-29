class Fixnum
  def digits_count(base = 10)
    count = proc do |n|
      q, _ = n.divmod(base)
      1 + (q > 0 ? count.(q) : 0)
    end
    count.(self)
  end

  def zeros
    zero = ''
    self.times {zero += '0'}
    zero
  end
end