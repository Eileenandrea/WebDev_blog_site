class ArticlesController < ApplicationController
    before_action :set_article, only: [:show]
    before_action :set_user_article, only: [:edit,:update,:destroy]
    before_action :require_user, except: [:index, :show]
    def show
    end
    def index
        @articles =Article.paginate(page: params[:page], per_page: 3)
        
    end
    def new
        @article = Article.new
    end
    def create
        @article = Article.new(articles_params)
        @article.user = current_user
        if @article.valid?
            @article.save
            flash[:notice] = 'Article was Created successfully.'
            redirect_to show_article_path(@article)
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
    def set_user_article
        articles  = current_user.articles
        if articles.find_by_id(params[:id])
            @article = articles.find(params[:id])
        else
            redirect_back fallback_location: articles_path
        end
   end
    def articles_params
        params.require(:article).permit(:name,:body,:photo,:fullbody,category_ids: [])
    end

    
end
