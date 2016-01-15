class OrdersController < ApplicationController
  def new
    @menu_item = MenuItem.find params[:menu_item_id]
  end

  def create
    @menu_item = MenuItem.find params[:menu_item_id]

    @order = Order.new(order_params)
    @order.menu_item = @menu_item

    if @order.save
      flash[:success] = ORDER_SUCCESSFULLY_MESSAGE
      redirect_to menu_path
    else
      flash[:error] = "Error: #{@order.errors.full_messages.to_sentence}"
      render "new"
    end
  end

  private
  def order_params
    params.require(:order).permit(:name, :phone, :address)
  end
end
