class Artist
  extend Concerns::Findable
  
  attr_accessor :name, :songs 
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end
  
  def self.all 
    @@all
  end 

  def self.destroy_all
    @@all.clear
  end 

  def self.create(created_artist)
    new(created_artist).tap {|a| a.save}
  end 
   
  def songs 
    @songs 
  end 
  
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end
  
  def genres
    self.songs.collect {|song| song.genre}.uniq 
  end 
  
end