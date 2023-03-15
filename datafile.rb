require 'json'

class DataFile
  def initialize(file_name)
    @path = "store/#{file_name}.json"
    File.write(@path, '[]') unless File.file?(@path)
  end
end
