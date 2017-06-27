require 'pry'

 class Song

  extend Memorable::ClassMethods
  extend Findable
  include Paramable
  include Memorable::InstanceMethods

   attr_accessor :name
   attr_reader :artist

  @@songs = []
  @@all = []

   def initialize
    @@songs << self
  end

  def self.find_by_name(name)
    @@songs.detect{|a| a.name == name}
    self.class.all << self
   end

   def artist=(artist)
     @artist = artist
   end

  def self.reset_all
    @@songs.clear
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end

  def self.count
    self.all.count
  end

 def self.all
    @@songs
    @@all
   end
 end
