require_relative "bank_account.rb"
require 'pry'

class Transfer

  attr_accessor :status
  attr_reader :receiver, :sender, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true && @sender.balance > amount
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.valid? && @status == "pending"
      @sender.pay_out(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.pay_out(@amount)
      @status = "reversed"
    else
      nil
    end
  end

end

# mendy = BankAccount.new("mendy")
# jeff = BankAccount.new("jeff")
# new_transfer = Transfer.new(mendy, jeff, 100)
# new_transfer.valid?
# new_transfer.execute_transaction
# going change the balance of sender and receiver by the amount
# change the TRANSFER STATUS to complete
