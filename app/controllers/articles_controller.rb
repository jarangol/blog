class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: [:show,:index]
    before_action :set_article, except: [:index,:new]

     #GET /articles
    }
    }
    def index
    #todos los registros
        @articles = Article.all
    end

    #GET /articles/:id
    def show
    end
    
    #GET /articles/new
    def new
        @article = Article.new
    end

    def create
        @article = current_user.articles.new(article_params)

        if @article.save
            redirect_to @article
        else
          render :new  
        end
    end

    def update
        if @article.update(article_params)
            redirect_to @article
        else
            render :edit
        end
    end

    def edit
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private 

    def article_params
        params.require(:article).permit(:title,:body)
    end
end 