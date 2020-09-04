require 'csv'
class BillingService
  attr_reader :tickets
  attr_accessor :report

  CSV_COLUMN = %w(dob doj passenger_name from to travel_class ticket_amount agent_charge cgst sgst)

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
    total_amount = cgst_total = sgst_total = 0
    tickets.each do |data|
      report << data.as_json
      total_amount += data["ticket_amount"] + data["agent_charge"]
      cgst_total += data["cgst"] if data["cgst"].present?
      sgst_total += data["sgst"] if data["sgst"].present?
    end
    CSV.open(file, "wb") do |csv|
      csv << Array.wrap(title) if respond_to?(:title) && title.present?
      csv << @attributes     
      report.each do |row|
        row = row.to_hash.with_indifferent_access        
        csv << @attributes.map{|attr| row[attr]}        
      end
      csv << ["", "", "", "", "", "", "Total Amount:", total_amount, cgst_total, sgst_total]
    end    
    file
  end

end