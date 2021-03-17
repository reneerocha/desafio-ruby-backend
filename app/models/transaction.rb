class Transaction < ApplicationRecord
has_one_attached :files


has_attached_file :text_file,
    :path => ":rails_root/public/system/:attachment/:id/:filename",
    :url => "/system/:attachment/:id/:filename"

 
do_not_validate_attachment_file_type :text_file
  
    
after_save :import

def relatorio(line)
    row = Iconv.conv("UTF8", "LATIN1", line)
 
    t = Transaction.create(
      
    type =>  row[0, 1].strip,
    date => row[1, 8].strip,
    value => (row[9, 10].strip.to_f/100),
    cpf => row[19, 11].strip,
    card => row[30, 12].strip,
    hour => row[42, 6].strip,
    owner => row[48, 14].strip,
    store => row[62, 19].strip
    )
   
end

  
  def import

    file =  File.open(self.text_file.path, "r")
    file.each_with_index do |line, index|
      Rails.logger.warn("#{line}")
      relatorio("#{line}")
    end

  end

end