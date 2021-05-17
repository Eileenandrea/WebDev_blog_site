class ArticlesController < ApplicationController
    before_action :set_article, only: [:show,:edit,:update,:destroy]
    
    def show
    end
    def index
        @articles = Article.all
    end
    def new
        @article = Article.new
    end
    def create
        @article = Article.new(articles_params)

        if @article.valid?
            @article.save
            redirect_to articles_path
        else
            render :new 
        end
    end
    def edit
    
    end
    def update

        if  @article.update(articles_params)
         flash[:notice] = 'Article was updated successfully.'
         redirect_to show_article_path(@article)
         else
             render 'edit'
        end
     end
    def destroy
        @article.destroy
        redirect_to articles_path(@article)
    end
    private
    def set_article
        @article = Article.find(params[:id])
   end
    def articles_params
        params.require(:article).permit(:name,:body,:photo)
    end
    
end