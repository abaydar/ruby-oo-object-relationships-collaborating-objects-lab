class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    # def self.new_by_filename(filename)
    #     artist = filename.split(" - ")[0] #parsing to split input into artist & song
    #     song = filename.split(" - ")[1]
    #     new_song = self.new(song) #create a new song using song string from filename
    #     new_song.artist_name = artist #use new_song.artist_name so the following method can convert string into an Artist instance?
    #     new_song
    # end

    def self.new_by_filename(filename)
        song = self.new(filename.split(" - ")[1])
        artist_name = Artist.find_or_create_by_name(filename.split(" - ")[0])
        song.artist = artist_name
        song
    end

    def artist_name=(name) #writer/setter
        self.artist = Artist.find_or_create_by_name(name) #change the artist "string" from filename into an Artist instance via the method find_or_create_by_name
        artist.add_song(self) #assign the artist name to the song
    end


        

end