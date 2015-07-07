class TagsController < ApplicationController
  def index
    @tags = Tag.all.order(tagname: :ASC)
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts.paginate(page: params[:page], :per_page => 10)
  end

  def new
    @tag = Tag.new
  end

  def edit
    
  end

  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_empty_tags

  end

  private

    def tag_params
       params.require(:tag).permit(:tag)
    end
end
