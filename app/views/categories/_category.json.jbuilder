json.extract! category, :id, :title, :description, :amount, :active, :created_at, :updated_at
json.url category_url(category, format: :json)
