class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  
  #Need to implement scopes
  def order
    if current_user.vendor?
      Order.where(:vendor => current_user.email)
    else
      Order.all
    end
  end
  
  def index
    @orders = order

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    if @order.save
       Notifications.new_order(@order).deliver
      redirect_to @order, notice: 'Order was successfully created.' 
    else
      render action: "new" 
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      if @order.status == "Outgoing" && !(attributes["status"] == "Outgoing") && @order.customer_email
        Notifications.outgoing_order(@order).deliver
      end
      if @order.ready_for_pickup && !attributes["ready_for_pickup"] && @order.user
        Notifications.pickup_order(@order).deliver
      end
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
