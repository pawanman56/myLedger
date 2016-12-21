class LedgersController < ApplicationController
    def index
        @ledgers = Ledger.all
    end
    
    def create
        @ledger = Ledger.create(ledger_params)
        redirect_to root_path
    end

    private

    def ledger_params
        params.require(:ledger).permit(:title, :amount, :date)
    end
end
