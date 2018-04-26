class Transfer
  attr_accessor :amount, :status
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"

  end
  # your code here
  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if status != "complete"
      if @sender.valid?
        @sender.balance -= @amount
        @receiver.deposit(@amount)
        @status = "complete"
      end
    end

    unless @sender.valid?
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
        @receiver.balance -= @amount
        @sender.deposit(@amount)
        @status = "reversed"
    end

  end
end
