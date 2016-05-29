class SearchService
  def initialize(subject = Organisation)
    @subject = subject
  end

  def search
    do_search
  end

  private
  def do_search
    "nothing"
  end
end
