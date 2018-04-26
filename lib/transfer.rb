class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      return true
    else
      false
    end
    # @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if status != "complete"
      @receiver.deposit(@amount)
      @sender.balance -= @amount
      @status = "complete"
    end

    if @sender.valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if status == "complete"
      @sender.deposit(@amount)
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end


end
