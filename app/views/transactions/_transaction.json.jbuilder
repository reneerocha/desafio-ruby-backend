json.extract! transaction, :id, :type, :date, :value, :cpf, :card, :hour, :owner, :store, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
