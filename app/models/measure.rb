class Measure < ActiveRecord::Base
  belongs_to :song, :dependent=>:destroy
  has_many :measure_notes, :order=>'octave_number asc'#, sort_order asc' #, note_id asc'
#  after_initialize :set_measure

  @@default_octave_number = 4
  cattr_accessor :default_octave_number

  #attr_reader :beats_left

  def beats_per_measure
  	if song
  		song.time_signature.split("/").first.to_i
  	else
  		4
  	end

  end

  def clear(options)
    if options[:position]
      self.measure_notes.where(position: options[:position]).delete_all
    elsif options[:measure_note]
      if options[:measure_note].is_a?(MeasureNote)
        self.measure_notes.where(id: options[:measure_note].id).first.delete
      elsif options[:measure_note].is_a?(Fixnum)
        self.measure_notes.where(id: options[:measure_note]).first.delete
      end
    end

    self.reload
    #self.measure_notes.reload
  end

  def replace(position, options)

    if chord_object = Chord.formatted_chord(options)
      clear(:position=>position)
      add_to_measure(:chord=>chord_object, :position=>position)
    end

  end

  def invert(position, direction)
    notes_at = self.notes_by_position[position]
    if direction == "up"
      note_to_change = notes_at.first
      add_to_measure(:note=>note_to_change.note, :octave=>note_to_change.octave_number+1, :position=>position)
      clear(:measure_note=>note_to_change)
    elsif direction == "down"
      note_to_change = notes_at.last
      add_to_measure(:note=>note_to_change.note, :octave=>note_to_change.octave_number-1, :position=>position)
      clear(:measure_note=>note_to_change)
    end
  end

  def add_to_measure(options)
    if options[:position]
      position = options[:position]
    else
      position = nil
    end

    #TODO: refactor this to be cleaner
    if options[:note]
      note = options[:note]

      if options[:octave]
        octave_number = options[:octave].to_i
      else
        octave_number = Measure.default_octave_number
      end

      if note.is_a?(Note)
        #set measure note with default values
        measure_note = MeasureNote.new(
          :note_id=>note.id,
          :octave_number => octave_number,
          :note_type_id => NoteType.find_by_name("quarter").id,
          :position => position || get_next_position(1),
          :sort_order => song.scale.note_position(note.name))

      elsif note.is_a?(Hash)
        measure_note = MeasureNote.new({:note_id=>note.id})
      end

      self.measure_notes << measure_note
    elsif options[:chord]
      measure_notes = Array.new

      next_position = get_next_position(1)
      note_type = NoteType.find_by_name("quarter").id
      octave_number = Measure.default_octave_number
      prior_note_id = 0

      #ensure that all chord notes get created with the same attributes in MeasureNote
      options[:chord].notes.each do |note|
        octave_number = note.id < prior_note_id ? octave_number + 1 : octave_number
        self.measure_notes << MeasureNote.new(
          :note_id=>note.id,
          :octave_number => octave_number,
          :note_type_id => note_type,
          :position => position || next_position,
          :sort_order => song.scale.note_position(note.name))
        prior_note_id = note.id
      end

    end

  end

  def remove_from_measure(options)
    if options[:measure_note]
    end

  end

  def get_next_position(count_of_note_added=1)
  	return -1 if beats_left == 0
    beats_per_measure - beats_left + count_of_note_added
  end

  def beats_left
    return 4 if self.measure_notes.empty?
    beats_per_measure - self.measure_notes.collect{|x| x.position}.max
  end

  def positions

    #get all the note positions, sort them, then turn them to strings
    measure_notes.collect{|x| x.position}.sort.uniq.collect{|n| n.to_s}
  end

  def notes_by_position
    note_hash = Hash.new
    measure_notes.each do |measure_note|
      position = measure_note.position.to_s
      if note_hash[position].nil?
        note_hash[position] = [measure_note]
      else
        note_hash[position] << measure_note
      end
    end

    note_hash
  end

  def chords_at(position)
    Chord.name_by_notes(notes_by_position[position])
  end

  def chord_at_position(position)
    chord = chords_at(position)
    unless chord.blank?
      chord.first.description
    else
      nil
    end
  end

  def melody_note(position)
    notes_by_position[position].last
  end

  def determine_chord(notes)

  end
#  private
#
#  def set_measure
#    @beats_left = self.beats_per_measure
#  end
end
