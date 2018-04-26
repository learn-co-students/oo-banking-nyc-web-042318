require_relative 'bank_account'
require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  TRANSFERS = []

  def initialize(sender, receiver, amount, status = "pending")
    #@sender = BankAccount.all.find {|account| account == sender}
    @sender = sender
    #@receiver = BankAccount.all.find {|account| account == receiver}
    @receiver = receiver
    @status = status
    @amount = amount
    TRANSFERS << self
  end

  def self.all
    TRANSFERS
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.valid? && receiver.valid? && self.status != "complete" && sender.balance >= amount
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
