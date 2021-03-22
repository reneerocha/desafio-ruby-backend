class Transaction < ApplicationRecord
has_one_attached :files

  
after_save :import

def relatorio(line)
    t = Transaction.create(
      
    type =>  line[0, 1].strip,
    date => line[1, 8].strip,
    value => (line[9, 10].strip.to_f/100),
    cpf => line[19, 11].strip,
    card => line[30, 12].strip,
    hour => line[42, 6].strip,
    owner => line[48, 14].strip,
    store => line[62, 19].strip
    )
   
end

  
  def import

    files_path = "#{Dir.tmpdir}/#{files.filename}"
    Rails.logger.warn("#{files_path}")
    File.open("CNAB.txt","r") do |file|
    	file.readlines.each do |line|
     		relatorio("#{line}")
    	end
    end	
  end


end