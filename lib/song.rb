require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.create
    @@all << new_song = self.new
    new_song
  end

  def self.new_by_name title
    new_song = self.new
    new_song.name = title
    new_song
  end

  def self.create_by_name title
    self.new_by_name(title).save
  end

  def self.find_by_name song
    @@all.each do |x|
      if x.name == song
        return x
      end
    end
    nil
  end

  def self.find_or_create_by_name song
    yolo = self.find_by_name(song)
    yolo == nil ? self.create_by_name(song) : yolo
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename filename
    array = filename.split(" - ")
    new_song = self.new_by_name(array[1].chomp(".mp3"))
    new_song.artist_name = array[0]
    new_song
  end

  def self.create_from_filename filename
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    @@all = []
  end

end