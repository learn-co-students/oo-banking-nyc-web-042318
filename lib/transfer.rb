require_relative 'bank_account'
require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    #need to call on BankAccount Valid? method for both sender and receiver
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if sender.valid? && amount <= sender.balance && self.status == "pending"

      sender.balance -= amount

      receiver.balance += amount
      self.status = "complete"

    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if sender.valid? && amount <= sender.balance && self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end
end
