require 'pry'
class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files 
    files_array = Dir['./spec/fixtures/**/*.mp3']
    normalized_files = files_array.map{|files| files.split("/")}.map do |file_name|
        file_name.pop
    end
    normalized_files    
    #binding.pry


    
    end

    def import
        files.each{|normalized| Song.new_by_filename(normalized)}
    end


end