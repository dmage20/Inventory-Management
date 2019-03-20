class CustomersController < ApplicationController
    def index
        @customers = Customer.where(user: current_user)
    end

    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(customer_prams)
        @customer.user_id = current_user.id

        if @customer.save
            redirect_to customers_path
        else
            render 'customers/new'
        end
    end

    private
    def customer_prams
        params.require(:customer).permit(:name, :address)
    end
end
