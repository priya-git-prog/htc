require 'csv'
class BillingService
  attr_reader :tickets
  attr_accessor :report

  CSV_COLUMN = %w(dob doj passenger_name from to travel_class amount)

  def initialize tickets_ids
    @tickets = Ticket.find(tickets_ids)
    @report = []
  end

  def generate_and_send_bill
    ExportCsvMailer.export_csv(generate_bill, "Bill for #{Date.today}", ["priyhinduja15@gmail.com"]).deliver_now
  end

  def generate_bill
    file = "htc-bill-#{Time.now.to_i}.csv"
    @attributes = CSV_COLUMN
    total_amount = 0
    tickets.each do |data|
      report << data.as_json
      total_amount += data["amount"]
    end
    CSV.open(file, "wb") do |csv|
      csv << Array.wrap(title) if respond_to?(:title) && title.present?
      csv << @attributes     
      report.each do |row|
        row = row.to_hash.with_indifferent_access        
        csv << @attributes.map{|attr| row[attr]}        
      end
      csv << ["", "", "", "", "", "Total amount:", total_amount]
    end    
    file
  end

end