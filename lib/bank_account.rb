class BankAccount

    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name)
      @name = name
      @balance = 1000
      @status = "open"
    end


    #use method= when setting
    #in this case we use attr_accessor to set only using below
    #method to call

    def deposit(amount)
      @balance += amount
    end

    def pay_out(amount)
      @balance -= amount
    end

    def display_balance
       "Your balance is $#{@balance}."
    end

    def valid?
      return true if @balance > 0 && @status == "open"
      false
    end

    def close_account
      @status = "closed"
    end

end