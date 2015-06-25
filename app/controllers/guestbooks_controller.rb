class GuestbooksController < ApplicationController
  before_action :set_guestbook, only: [:show, :edit, :update, :destroy]

  def index
    @guestbooks = Guestbook.paginate(page: params[:page], :per_page => 10).order('created_at DESC')
    @guestbook = Guestbook.new
  end

  def show
  end

  def new
    @guestbook = Guestbook.new
  end

  def edit
  end

  def create
    @guestbook = Guestbook.new(guestbook_params) 
    
    if  @guestbook.save
      flash[:success] = "message_saved"
      if signed_in?
        @guestbook.update_attributes(:name => false, :user_id => current_user.id) 
      end
      redirect_to  guestbooks_path
    else
      flash.now[:error] = 'message_not_saved' 
      @guestbooks = Guestbook.paginate(page: params[:page], :per_page => 10).order('created_at DESC')
      render 'index'
    end
  end

  def update
  end

  def destroy
    @guestbook.destroy
    respond_to do |format|
      format.html { redirect_to guestbooks_url, notice: 'Guestbook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guestbook
      @guestbook = Guestbook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guestbook_params
      params.require(:guestbook).permit(:name, :message)
    end
end
