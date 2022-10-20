require 'rails_helper'

describe Album do
  it { should have_many(:songs) }
  it { should validate_presence_of :name }
  it { should validate_length_of(:name).is_at_most(100) }
  it { should have_many(:artists).through(:album_artists) }
  

  it("titleizes the name of an album") do
    album = Album.create({name: "giant steps", genre: "jazz"})
    expect(album.name()).to(eq("Giant Steps"))
  end

 
  it("has many songs") do
    album = Album.create(name: "album")
    song1 = Song.create(name: "song1", album_id: album.id)
    song2 = Song.create(name: "song2", album_id: album.id)
    expect(album.songs()).to(eq([song1, song2]))
  end
end