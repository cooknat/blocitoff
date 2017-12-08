class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new
    @item.name = params[:item][:name]
    @item.user = current_user
    
     
     if @item.save
       flash[:notice] = "Item was saved."
       redirect_to :back
     else
       flash.now[:alert] = "There was an error saving the item. Please try again."
       render :new
     end
  end  
  
  def destroy
      @item =Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item completed and deleted successfully."
    else
      flash.now[:alert] = "There was an error deleting the item."
    end
    
    respond_to do |format|
      format.html 
      format.js
    end

  end 
  
  
end
