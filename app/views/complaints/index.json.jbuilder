# frozen_string_literal: true

json.complaints do
  json.array! @complaints do |complaint|
    json.partial! 'partials/complaint', complaint: complaint
  end
end

json.partial! 'partials/paging', collection: @complaints
