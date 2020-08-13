require 'csv'
class ExportCsvMailer < ActionMailer::Base
  default :from => 'hemalitravels@gmail.com'

  def export_csv(file_path, subject = nil, emails = [], template = 'export_csv', body = nil)
    params = {
      :to => emails.join(','),
      :subject => subject
    }
    formats = {html: ["export_csv", false]}    
    attachments[file_path] = File.read(file_path)
    mail(to: emails, subject: subject, template_name: template)
  end
end