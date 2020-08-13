json.extract! ticket, :id, :dob, :doj, :passenger_name, :from, :to, :travel_class, :amount, :company_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
