require_relative "bank_account"

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if self.receiver.valid? && self.sender.valid? && self.status == "pending"
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && self.sender.balance > self.amount
      self.receiver.deposit(self.amount)
      self.sender.withdrawal(self.amount)
      self.status = "complete"
    elsif self.sender.balance < self.amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.withdrawal(self.amount)
      self.status = "reversed"
    end
  end


end
