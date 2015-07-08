class RecallsController < ApplicationController
  before_action :set_recall, only: [:show, :edit, :destroy]

  def index
    @recalls = Recall.paginate(page: params[:page], :per_page => 10).order('created_at DESC')
    @recall = Recall.new
  end

  def show
  end

  def new
    @recall = Recall.new
  end

  def edit
  end

  def create
    @recall = Recall.new(recall_params) 
    
    if  @recall.save
      flash[:success] = "message_saved"
      if signed_in?
        @recall.update_attributes(:name => false, :user_id => current_user.id) 
      end
      redirect_to recalls_path
    else
      flash.now[:error] = 'message_not_saved' 
      @recalls = Recall.paginate(page: params[:page], :per_page => 10).order('created_at DESC')
      render 'index'
    end
  end

  def update
  end

  def destroy
    @recall.destroy
    respond_to do |format|
      format.html { redirect_to recalls_url, notice: 'recall was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_recall
      @recall = Recall.find_by_id(params[:id])
      render_404 unless @recall
    end

    def recall_params
      params.require(:recall).permit(:name, :message)
    end
end
