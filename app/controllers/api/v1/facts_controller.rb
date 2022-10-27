class Api::V1::FactsController < ApplicationController
    before_action :find_fact, only: [:show,:update,:destroy]


    def index
        @facts = Fact.all
        render json: @facts

    end

    def show
        render json: @fact 
    end

    def create 

        @fact = Fact.new(fact_params)
        if @fact.save
            render json: @fact 

        else
            render error: {error: "unable to create fact"},status: :unprocessable_entity
        end
    end
    
   def update 
    if @fact 
        @fact.update(fact_params)
        render json: {message: "Fact updated"},status:200
    else 
        render json: {error: "unable to update fact"},status: :unprocessable_entity
  
    end
    
   end
   

   def destroy 
    if @fact 
        @fact.destroy 
        render json: {message: "Fact destroyed"},status: 200
    else
        render json: {error: "unable to destory fact"},status: :unprocessable_entity
    end

   end  

   private

   def fact_params 
    params.require(:fact).permit(:fact,:likes,:user_id)
   end

   def find_fact
    @fact = Fact.find(params[:id])
   end

end
