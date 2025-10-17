class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
# Submitted form data is put into the params Hash, alongside captured route parameters. Thus, the create action can access the submitted title via
# params[:article][:title] and the submitted body via params[:article][:body]
#  However, we must still specify what values are allowed in that Hash. Otherwise, a malicious user could potentially submit extra form fields
#  and overwrite private data.
