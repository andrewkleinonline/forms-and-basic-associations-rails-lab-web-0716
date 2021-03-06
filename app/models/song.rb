class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(genre_name)
    genre = Genre.find_or_create_by(name: genre_name)
    self.genre = genre
  end

  def genre_name
    self.genre.name if self.genre
  end

  def artist_name=(artist_name)
    artist = Artist.find_or_create_by(name: artist_name)
    self.artist = artist
  end

  def artist_name
    self.artist.name if self.artist
  end

  def note_contents=(note_contents)
    note_contents.each do |note_content|
      if note_content != ""
        note = Note.find_or_create_by(content: note_content)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end
end
