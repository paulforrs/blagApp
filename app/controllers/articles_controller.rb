class ArticlesController < ApplicationController
    before_action :set_article, only: %i[show edit update destroy]

    def home
        @articles = Article.all.order(updated_at: :desc).limit(5)
    end
    def index
        @articles = Article.all.order(created_at: :desc)
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)

        if @article.save
            redirect_to article_path(@article), notice: "Article has been created successfully!"
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @article.update(article_params)
            redirect_to article_path(@article), notice: "Article has been updated successfully!"
        else
            render :edit
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path, notice: "Article has been deleted successfully!"
    end

    private

    def article_params
        params.require(:article).permit(:title,:body,:author)
    end

    def set_article
        @article = Article.find(params[:id])
    end
end
