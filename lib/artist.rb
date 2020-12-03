
class Artist
    attr_accessor :name #why don't we need :song here?

    @@all = []

    def initialize(name) #need to save in initialize to keep track of instances
        @name = name
        save
    end

    def self.all #reader method to view all instances of Artist
        @@all
    end

    def save #save each Artist instance
        @@all << self
    end

    def add_song(song) #assign the artist to the input song
        song.artist = self
    end

    def songs #iterate over Song class to find all the songs that have the same artist
        Song.all.select{|song| song.artist == self}
    end

    def self.find(name) #search artist class: find the artist by it's name
        self.all.find{|artist| artist.name == name}
    end    

    def self.find_or_create_by_name(name) #search artist class: if artist name already exists, return this.  If it is not, create a new instance with this name
        self.find(name) ? self.find(name) : self.new(name)
    end

    # def self.find_or_create_by_name(name)
    #     if (self.name.nil?)
    #         self.new(name)
    #     else
    #         self.all.find{|artist| artist.name == name}
    #     end
    # end

    def print_songs #iterate over song method(already separated into songs by a certain artist) and put each song name to the console
        songs.each{|song| puts song.name}
    end



end
