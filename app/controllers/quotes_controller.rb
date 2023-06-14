class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = Quote.all
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to quotes_path, notice: "Quote was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @quote.update(quote_params)
      flash[:success] = "Quote was successfully updated"
      redirect_to quotes_path, notice: "Quote was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if @quote.destroy
      flash[:success] = 'Quote was successfully deleted.'
      redirect_to quotes_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to quotes_path
    end
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
