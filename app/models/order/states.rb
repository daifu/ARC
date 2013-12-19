module Order::States

  def self.included(base)
    base.state_machine :state, :initial => :created do
      after_transition :on => :paid,    :do => [:record_paid_at, :email_thank_you_letter]
      after_transition :on => :canceled,:do => [:record_canceled_at, :email_canceled_letter]

      event :pay do
        transition :created => :paid
      end

      event :cancel do
        transition [:created, :paid] => :canceled
      end
    end
  end

  def record_paid_at
  end

  def email_thank_you_letter
  end

  def record_canceled_at
  end

  def email_canceled_letter
  end

end