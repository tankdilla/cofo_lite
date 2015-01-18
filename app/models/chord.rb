class Chord < ActiveRecord::Base
  has_many :chord_definitions

  attr_accessor :chord_name, :notes, :root_note

  def show_notes
    @notes.collect(&:name)
  end

  def description
    "#{root_note}#{abbrev}"
  end

  def short_description
    "#{root_note}#{abbrev_2 || abbrev}"
  end

  def invert(inversion_number)
    #inversion number should be 0, 1, 2, or 3
    self.notes.rotate(inversion_number)
  end

  def add_notes(chord_array)
    @notes = chord_array
    @root_note = chord_array[0]
  end

  def get_chord_notes
    self.chord_definitions.each do |d|
      chord_array << scale.get_note({:scale_number => d.scale_number, :modifier => d.modifier})
    end

    chord.notes = chord_array
  end

  def definition_string
    unless chord_definitions.empty?
      string = "#{root_note}#{abbrev} - "
      chord_definitions.each do |d|
        unless d.modifier.blank?
          string << d.modifier
        end

        string << d.scale_number
      end
    else
      nil
    end

  end

  def intervals
    chord_definitions.collect(&:interval_id)
  end

  class << self
    def create_chord(chord_options)
      exclude_fifth = chord_options[:exclude_fifth] || false

      if chord_options[:base_note]

        base_note = chord_options[:base_note]

        if chord_options[:melody_note] && chord_options[:melody_note].is_a?(String)
          melody_note = Note.where(name: chord_options[:melody_note]).first
        else
          melody_note = nil
        end

        if chord_options[:chord_name]
          #if a chord name, ie major, minor, diminished is specified, find the notes based on the chord table
          #else, use the 1, 3, 5, and 7 notes based on the chord letter specified

          chord_type = chord_options[:chord_name]

          chord = Chord.find_by_name(chord_type)
          chord.root_note = base_note
          #chord.chord_name = "#{base_note} #{chord_type}"

          scale = Scale.create_scale(base_note)
          chord_array = Array.new

          if chord
            chord.chord_definitions.each do |d|
              next if d.scale_number == 5 && exclude_fifth
              chord_note = scale.get_note({:scale_number => d.scale_number, :modifier => d.modifier})

              if melody_note
                next if melody_note.id == chord_note.id
              end

              chord_array << chord_note
            end

            chord.notes = chord_array
          else
            nil
          end

        elsif chord_options[:chord_letter]
          scale = Scale.create_scale(base_note, chord_options[:chord_letter])

          chord =
            case chord_options[:chord_letter]
            when "I", "IV"
              Chord.where(name: "major").first #"major 7"
            when "II", "III", "VI"
              Chord.where(name: "minor").first #"minor 7"
            when "V"
              Chord.where(name: "major").first #"dominant 7"
            when "VII"
              Chord.where(name: "diminished 7").first
            end

          #chord.root_note = "#{base_note} #{chord_options[:chord_letter]}"
          chord.root_note = base_note
          chord_array = Array.new

          #For now, if the chord letter is passed in, it will just use a simple 1,3,5,7 for whichever mode it's in
          #In the future, i'll implement a chord suggestion function for each chord letter I-VII
          [1, 3, 5, 7].each do |d|
            chord_note = scale.get_note({:scale_number => d})

            if melody_note
              next if melody_note.id == chord_note.id
            end

            chord_array << chord_note
          end

          chord.notes = chord_array
        end
      else
        chord = nil
      end

      if melody_note
        chord.notes << melody_note
      end

      chord
    end

    def formatted_chord(p_options)
      options = {}

      if p_options[:chord_string]
        chord_params = p_options[:chord_string].split(',')
        chord_symbol = ChordSymbol.find(chord_params[1].to_i)
        options[:base_note] = chord_params[0]
        options[:chord_letter] = chord_symbol.name
      elsif p_options[:chord_name] && p_options[:chord_note]
        options[:base_note] = p_options[:chord_note]
        options[:chord_name] = p_options[:chord_name]
      end

      options[:melody_note] = p_options[:melody_note]

      Chord.create_chord(options)
    end

    def possible_chords(options)
      melody_note = options[:melody_note]
      scale_key = options[:scale_key]

      scale = Scale.create_scale(scale_key)
      #for now, possible chords for a melody and scale key will only be based on the notes within the scale key
      if scale.scale_note_names.include?(melody_note)
        scale_chords = scale.scale_notes.collect{|n| Chord.formatted_chord(:chord_string=>n.description)}
        possible_chords = scale_chords.select{|c| c.show_notes.include?(melody_note)}

      else
        []
      end
    end

    def name_by_notes(notes_array)
      simple_notes_array = Note.simple_notes(notes_array)

      chord_key = simple_notes_array.first
      chord_key_scale = Scale.create_scale(chord_key, "all")
      chord_key_scale_notes  = chord_key_scale.scale_notes.collect(&:name)

      note_positions = simple_notes_array.collect{|n| chord_key_scale_notes.index(n)+1}

      possible_chords = Chord.all.collect(&:id)
      note_positions.each do |position|
        possible_chords = ChordDefinition.where(interval_id: position).where(chord_id: possible_chords).collect(&:chord_id)
      end

      possible_chords = Chord.where(id: possible_chords).select{|c| c.intervals == note_positions}
      possible_chords.each{|c| c.root_note = chord_key}
    end

    def chords_for_melody(melody_note, scale_note)

    end

    def chord_by_scale_and_number(key, number, options={})
      chord_number = number

      options[:use_major] == true if options.blank?

      if options[:use_major] && [3, 6, 7].include?(number)

        chord_number =
          case number
            when 3
              1
            when 6
              4
            when 7
              5
          end
      end

      scale = Scale.create_scale(key)
      note = scale.get_note(scale_number: chord_number, modifier: options[:modifier])

      formatted = options[:chord] || formatted_chord(chord_string: "#{note.name}, #{chord_number}")

      if [3, 6, 7].include? number
        "#{note.name}#{formatted.abbrev} / #{scale.get_note(scale_number: number, modifier: options[:modifier]).name}"
      else
        "#{note.name}#{formatted.abbrev}"
      end
    end


  end
end
