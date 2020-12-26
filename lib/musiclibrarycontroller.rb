require 'pry'
class MusicLibraryController


    def initialize(path = "./db/mp3s")
        @path = path
        MusicImporter.new(path).import
    end

    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"

        input = gets.strip until input == "exit"

    end

    def list_songs
       
        songs = Song.all.uniq.sort_by {|song| song.name}
        songs.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end

    def list_artists
        artists = Artist.all.sort_by {|artist| artist.name}
        #  binding.pry 
        artists.each_with_index { |artist, index| puts "#{index + 1}. #{artist.name}"}
    end

    def list_genres
        genres = Genre.all.sort_by {|genre| genre.name}
        genres.each_with_index { |genre, index| puts "#{index + 1}. #{genre.name}"}
    end

end