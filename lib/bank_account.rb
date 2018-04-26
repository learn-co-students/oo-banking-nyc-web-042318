require_relative 'transfer'
require 'pry'

class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  BANKACCOUNTS = []

  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance
    @status = status
    BANKACCOUNTS << self
  end

  def deposit(num)
    @balance += num
  end

  def self.all
    BANKACCOUNTS
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0 && self.name == @name
  end

  def close_account
    self.status = "closed"
  end

end
