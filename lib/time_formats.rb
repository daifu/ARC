class Time
  def mdyyyy
    self.strftime("%m/%d/%Y")
  end

  def mdyy
    self.strftime("%m/%d/%y")
  end

  def yymmdd_hyphen
    self.strftime("%y-%m-%d")
  end

  def mmddyyyyhhii
    self.strftime("%m/%d/%Y %H:%M")
  end

  def yyyymmddhhii_hyphen
    self.strftime("%Y-%m-%d %H:%M")
  end
end

class Date
  def yymmdd_hyphen
    self.strftime("%y-%m-%d")
  end

  def yyyymmdd_hyphen
    self.strftime("%Y-%m-%d")
  end

  def yyyymmddhhii_hyphen
    self.strftime("%Y-%m-%d %H:%M")
  end
end