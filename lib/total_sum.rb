module TotalSum
  def total
    map(&:amount).sum
  end
end