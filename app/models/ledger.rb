class Ledger < ActiveRecord::Base
    
    validates :title, :amount, :date, presence: true
    
    def self.amount
        sum(:amount)
    end
    
    def self.balance
        where("amount > ?",0).sum(:amount)
    end
    
    def self.debt
        where("amount < ?",0).sum(:amount)
    end
end
