class FileUploadsController < ApplicationController
  def new
  	@transaction = Transaction.find(params[:transaction_id])
  end

def create
  @transaction  = Transaction.find(params[:transaction_id])
  @transaction.files.attach(params[:transaction][:files])
  redirect_to transaction_path(@transaction)
end
end
