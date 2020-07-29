json.paging do
  current, total, per_page = collection.current_page, collection.total_pages, collection.limit_value
  next_url = (current == total ? nil : path_to_next_page(collection))
  previous_url = (current > 1 ? path_to_prev_page(collection) : nil)
  json.current  current
  json.previous (current > 1 ? (current - 1) : nil)
  json.previous_url previous_url
  json.next     (current == total ? nil : (current + 1))
  json.next_url next_url
  json.per_page per_page
  json.pages    total
  json.items    collection.size
  json.count    collection.total_count
end
