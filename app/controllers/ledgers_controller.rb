class LedgersController < ApplicationController
    def index
        @ledgers = Ledger.order("created_at DESC")
        @blnc = @ledgers.balance
        @dbt = @ledgers.debt
        @amt = @ledgers.amount
        
    end
    
    def create
        @ledger = Ledger.create(ledger_params)
        redirect_to root_path
    end
    
    def edit
        @ledger = Ledger.find(params[:id])
    end
    
    def update
        @ledger = Ledger.find(params[:id])
        if @ledger.update(ledger_params)
            #flash[:success] = "This entry has been updated!"
            redirect_to root_path
        else
            #flash[:alert] = "Woops! Looks like there is an error."
            redirect_to edit_ledger_path(params[:id])
        end
    end
    
    def destroy
        @ledger = Ledger.find(params[:id])
        @ledger.destroy
        flash[:success] = "This idea has been deleted!"
        redirect_to root_path
    end

    private

    def ledger_params
        params.require(:ledger).permit(:title, :amount, :date)
    end
end
