class UsersController < ApplicationController
    before_action :require_user, except: [:index, :show, :new, :create]
    before_action :set_user, only: [:show]
    before_action :set_user_own, only: [:edit, :update, :destroy]
    def new
        @user = User.new
    end
    def edit
       
    end
    def update
       
        if @user.update(user_params)
            flash[:notice]="Your account information has been successfully updated"
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end
    def create
        @user = User.new(user_params)
        if@user.save
            session[:user_id] = @user.id
            flash[:notice]="Welcome to the Alpha Blog #{@user.username}, you have successfully sign up"
            redirect_to articles_path
        else
            render 'new'
        end

    end
    def show
        
        @articles = @user.articles.paginate(page: params[:page], per_page: 3)
    end
    def index
        @users = User.all
    end
    def destroy
        @user.destroy
        session[:user_id] = nil
        flash[:notice] = "account and all Associated article successfully deleted"
        redirect_to login_path
    end
    private
    def set_user
        @user = User.find(params[:id])
    end
    def set_user_own
       
        if current_user == User.find(params[:id])
            @user = User.find(params[:id])
        else
            redirect_back fallback_location: articles_path
        end
    end
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
