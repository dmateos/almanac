class SearchesController < ApplicationController
  def index

  end

  def show
    if params[:search]
      searcher = SearchService.new(Organisation)
      @results = searcher.search(params[:search])
    end
  end
end
