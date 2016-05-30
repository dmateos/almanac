class SearchService
  def initialize(search_interface = Organisation)
    @search_interface = search_interface
  end

  def search(query)
    do_search(query)
  end

  private
  def do_search(query)
    @search_interface.search(
      query: { query_string: {
        query: "*#{query}*"
      }}
    ).records
  end
end
