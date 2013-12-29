class RandomGenerator
  def self.generate_number(digits=1, base=10)
    num = SecureRandom.random_number(base**digits)
    "#{(digits - num.digits_count).zeros}#{num}"
  end
end