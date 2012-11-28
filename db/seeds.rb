# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Note.delete_all

Note.create(:name=>"C", :sort_order=>1)
Note.create(:name=>"Db", :sort_order=>2)
Note.create(:name=>"D", :sort_order=>3)
Note.create(:name=>"Eb", :sort_order=>4)
Note.create(:name=>"E", :sort_order=>5)
Note.create(:name=>"F", :sort_order=>6)
Note.create(:name=>"Gb", :sort_order=>7)
Note.create(:name=>"G", :sort_order=>8)
Note.create(:name=>"Ab", :sort_order=>9)
Note.create(:name=>"A", :sort_order=>10)
Note.create(:name=>"Bb", :sort_order=>11)
Note.create(:name=>"B", :sort_order=>12)

Interval.delete_all
Interval.create(:name=>"minor 2nd", :half_step=>1)
Interval.create(:name=>"major 2nd", :half_step=>2)
Interval.create(:name=>"minor 3rd", :half_step=>3)
Interval.create(:name=>"major 3rd", :half_step=>4)
Interval.create(:name=>"perfect 4th", :half_step=>5)
Interval.create(:name=>"tritone", :half_step=>6)
Interval.create(:name=>"perfect 5th", :half_step=>7)
Interval.create(:name=>"minor 6th", :half_step=>8)
Interval.create(:name=>"major 6th", :half_step=>9)
Interval.create(:name=>"minor 7th", :half_step=>10)
Interval.create(:name=>"major 7th", :half_step=>11)
Interval.create(:name=>"octave", :half_step=>12)

Mode.delete_all
Mode.create(:name => "Ionian", :letter => "I")
Mode.create(:name => "Dorian", :letter => "II")
Mode.create(:name => "Phrygian", :letter => "III")
Mode.create(:name => "Lydian", :letter => "IV")
Mode.create(:name => "Mixolydian", :letter => "V")
Mode.create(:name => "Aeolian", :letter => "VI")
Mode.create(:name => "Locrian", :letter => "VII")
Mode.create(:name => "All", :letter => "all")

ModeInterval.delete_all
ModeInterval.create(:mode_id =>1, :interval_id =>2, :sort_order=>1)
ModeInterval.create(:mode_id =>1, :interval_id =>2, :sort_order=>2)
ModeInterval.create(:mode_id =>1, :interval_id =>1, :sort_order=>3)
ModeInterval.create(:mode_id =>1, :interval_id =>2, :sort_order=>4)
ModeInterval.create(:mode_id =>1, :interval_id =>2, :sort_order=>5)
ModeInterval.create(:mode_id =>1, :interval_id =>2, :sort_order=>6)
ModeInterval.create(:mode_id =>1, :interval_id =>1, :sort_order=>7)

ModeInterval.create(:mode_id =>2, :interval_id =>2, :sort_order=>1)
ModeInterval.create(:mode_id =>2, :interval_id =>1, :sort_order=>2)
ModeInterval.create(:mode_id =>2, :interval_id =>2, :sort_order=>3)
ModeInterval.create(:mode_id =>2, :interval_id =>2, :sort_order=>4)
ModeInterval.create(:mode_id =>2, :interval_id =>2, :sort_order=>5)
ModeInterval.create(:mode_id =>2, :interval_id =>1, :sort_order=>6)
ModeInterval.create(:mode_id =>2, :interval_id =>2, :sort_order=>7)

ModeInterval.create(:mode_id =>3, :interval_id =>1, :sort_order=>1)
ModeInterval.create(:mode_id =>3, :interval_id =>2, :sort_order=>2)
ModeInterval.create(:mode_id =>3, :interval_id =>2, :sort_order=>3)
ModeInterval.create(:mode_id =>3, :interval_id =>2, :sort_order=>4)
ModeInterval.create(:mode_id =>3, :interval_id =>1, :sort_order=>5)
ModeInterval.create(:mode_id =>3, :interval_id =>2, :sort_order=>6)
ModeInterval.create(:mode_id =>3, :interval_id =>2, :sort_order=>7)

ModeInterval.create(:mode_id =>4, :interval_id =>2, :sort_order=>1)
ModeInterval.create(:mode_id =>4, :interval_id =>2, :sort_order=>2)
ModeInterval.create(:mode_id =>4, :interval_id =>2, :sort_order=>3)
ModeInterval.create(:mode_id =>4, :interval_id =>1, :sort_order=>4)
ModeInterval.create(:mode_id =>4, :interval_id =>2, :sort_order=>5)
ModeInterval.create(:mode_id =>4, :interval_id =>2, :sort_order=>6)
ModeInterval.create(:mode_id =>4, :interval_id =>1, :sort_order=>7)

ModeInterval.create(:mode_id =>5, :interval_id =>2, :sort_order=>1)
ModeInterval.create(:mode_id =>5, :interval_id =>2, :sort_order=>2)
ModeInterval.create(:mode_id =>5, :interval_id =>1, :sort_order=>3)
ModeInterval.create(:mode_id =>5, :interval_id =>2, :sort_order=>4)
ModeInterval.create(:mode_id =>5, :interval_id =>2, :sort_order=>5)
ModeInterval.create(:mode_id =>5, :interval_id =>1, :sort_order=>6)
ModeInterval.create(:mode_id =>5, :interval_id =>2, :sort_order=>7)

ModeInterval.create(:mode_id =>6, :interval_id =>2, :sort_order=>1)
ModeInterval.create(:mode_id =>6, :interval_id =>1, :sort_order=>2)
ModeInterval.create(:mode_id =>6, :interval_id =>2, :sort_order=>3)
ModeInterval.create(:mode_id =>6, :interval_id =>2, :sort_order=>4)
ModeInterval.create(:mode_id =>6, :interval_id =>1, :sort_order=>5)
ModeInterval.create(:mode_id =>6, :interval_id =>2, :sort_order=>6)
ModeInterval.create(:mode_id =>6, :interval_id =>2, :sort_order=>7)

ModeInterval.create(:mode_id =>7, :interval_id =>1, :sort_order=>1)
ModeInterval.create(:mode_id =>7, :interval_id =>2, :sort_order=>2)
ModeInterval.create(:mode_id =>7, :interval_id =>2, :sort_order=>3)
ModeInterval.create(:mode_id =>7, :interval_id =>1, :sort_order=>4)
ModeInterval.create(:mode_id =>7, :interval_id =>2, :sort_order=>5)
ModeInterval.create(:mode_id =>7, :interval_id =>2, :sort_order=>6)
ModeInterval.create(:mode_id =>7, :interval_id =>2, :sort_order=>7)

ModeInterval.create(:mode_id =>8, :interval_id =>1, :sort_order=>1)
ModeInterval.create(:mode_id =>8, :interval_id =>1, :sort_order=>2)
ModeInterval.create(:mode_id =>8, :interval_id =>1, :sort_order=>3)
ModeInterval.create(:mode_id =>8, :interval_id =>1, :sort_order=>4)
ModeInterval.create(:mode_id =>8, :interval_id =>1, :sort_order=>5)
ModeInterval.create(:mode_id =>8, :interval_id =>1, :sort_order=>6)
ModeInterval.create(:mode_id =>8, :interval_id =>1, :sort_order=>7)
ModeInterval.create(:mode_id =>8, :interval_id =>1, :sort_order=>8)
ModeInterval.create(:mode_id =>8, :interval_id =>1, :sort_order=>9)
ModeInterval.create(:mode_id =>8, :interval_id =>1, :sort_order=>10)
ModeInterval.create(:mode_id =>8, :interval_id =>1, :sort_order=>11)
ModeInterval.create(:mode_id =>8, :interval_id =>1, :sort_order=>12)

Chord.delete_all
Chord.create(:name => "major", :abbrev => "maj", :abbrev_2 => "M")
Chord.create(:name => "minor", :abbrev => "min", :abbrev_2 => "m")
Chord.create(:name => "diminished", :abbrev => "dim")
Chord.create(:name => "augmented", :abbrev => "aug")
Chord.create(:name => "major 7", :abbrev => "maj7", :abbrev_2 => "M7")
Chord.create(:name => "minor 7", :abbrev => "min7", :abbrev_2 => "m7")
Chord.create(:name => "dominant 7", :abbrev => "7")
Chord.create(:name => "diminished 7", :abbrev => "dim7")
Chord.create(:name => "major 9", :abbrev => "maj9", :abbrev_2 => "M9")
Chord.create(:name => "minor 9", :abbrev => "min9", :abbrev_2 => "m9")
Chord.create(:name => "dominant 9", :abbrev => "9")
Chord.create(:name => "minor 11", :abbrev => "min11", :abbrev_2 => "m11")
Chord.create(:name => "dominant 13", :abbrev => "13")
Chord.create(:name => "half diminished", :abbrev => "min7b5")

#major
ChordDefinition.delete_all
ChordDefinition.create(:chord_id => 1, :scale_number => 1, :sort_order => 1)
ChordDefinition.create(:chord_id => 1, :scale_number => 3, :sort_order => 2)
ChordDefinition.create(:chord_id => 1, :scale_number => 5, :sort_order => 3)

#minor
ChordDefinition.create(:chord_id => 2, :scale_number => 1, :sort_order => 1)
ChordDefinition.create(:chord_id => 2, :scale_number => 3, :modifier => "b", :sort_order => 2)
ChordDefinition.create(:chord_id => 2, :scale_number => 5, :sort_order => 3)

#diminished
ChordDefinition.create(:chord_id => 3, :scale_number => 1, :sort_order => 1)
ChordDefinition.create(:chord_id => 3, :scale_number => 3, :modifier => "b", :sort_order => 2)
ChordDefinition.create(:chord_id => 3, :scale_number => 5, :modifier => "b", :sort_order => 3)

#augmented
ChordDefinition.create(:chord_id => 4, :scale_number => 1, :sort_order => 1)
ChordDefinition.create(:chord_id => 4, :scale_number => 3, :modifier => "#", :sort_order => 2)
ChordDefinition.create(:chord_id => 4, :scale_number => 5, :modifier => "#", :sort_order => 3)

#major 7
ChordDefinition.create(:chord_id => 5, :scale_number => 1, :sort_order => 1)
ChordDefinition.create(:chord_id => 5, :scale_number => 3, :sort_order => 2)
ChordDefinition.create(:chord_id => 5, :scale_number => 5, :sort_order => 3)
ChordDefinition.create(:chord_id => 5, :scale_number => 7, :sort_order => 4)

#minor 7
ChordDefinition.create(:chord_id => 6, :scale_number => 1, :sort_order => 1)
ChordDefinition.create(:chord_id => 6, :scale_number => 3, :modifier => "b", :sort_order => 2)
ChordDefinition.create(:chord_id => 6, :scale_number => 5, :sort_order => 3)
ChordDefinition.create(:chord_id => 6, :scale_number => 7, :modifier => "b", :sort_order => 4)

#dominant 7
ChordDefinition.create(:chord_id => 7, :scale_number => 1, :sort_order => 1)
ChordDefinition.create(:chord_id => 7, :scale_number => 3, :sort_order => 2)
ChordDefinition.create(:chord_id => 7, :scale_number => 5, :sort_order => 3)
ChordDefinition.create(:chord_id => 7, :scale_number => 7, :modifier => "b", :sort_order => 4)

#diminished 7
ChordDefinition.create(:chord_id => 8, :scale_number => 1, :sort_order => 1)
ChordDefinition.create(:chord_id => 8, :scale_number => 3, :modifier => "b", :sort_order => 2)
ChordDefinition.create(:chord_id => 8, :scale_number => 5, :modifier => "b", :sort_order => 3)
ChordDefinition.create(:chord_id => 8, :scale_number => 6, :sort_order => 4)

#major 9
ChordDefinition.create(:chord_id => 9, :scale_number => 1, :sort_order => 1)
ChordDefinition.create(:chord_id => 9, :scale_number => 3, :sort_order => 2)
ChordDefinition.create(:chord_id => 9, :scale_number => 5, :sort_order => 3)
ChordDefinition.create(:chord_id => 9, :scale_number => 7, :sort_order => 4)
ChordDefinition.create(:chord_id => 9, :scale_number => 9, :sort_order => 5)

#minor 9
ChordDefinition.create(:chord_id => 10, :scale_number => 1, :sort_order => 1)
ChordDefinition.create(:chord_id => 10, :scale_number => 3, :modifier => "b", :sort_order => 2)
ChordDefinition.create(:chord_id => 10, :scale_number => 5, :sort_order => 3)
ChordDefinition.create(:chord_id => 10, :scale_number => 7, :modifier => "b", :sort_order => 4)
ChordDefinition.create(:chord_id => 10, :scale_number => 9, :sort_order => 5)

#dominant 9
ChordDefinition.create(:chord_id => 11, :scale_number => 1, :sort_order => 1)
ChordDefinition.create(:chord_id => 11, :scale_number => 3, :sort_order => 2)
ChordDefinition.create(:chord_id => 11, :scale_number => 5, :sort_order => 3)
ChordDefinition.create(:chord_id => 11, :scale_number => 7, :modifier => "b", :sort_order => 4)
ChordDefinition.create(:chord_id => 11, :scale_number => 9, :sort_order => 5)

#minor 11
ChordDefinition.create(:chord_id => 12, :scale_number => 1, :sort_order => 1)
ChordDefinition.create(:chord_id => 12, :scale_number => 3, :modifier => "b", :sort_order => 2)
ChordDefinition.create(:chord_id => 12, :scale_number => 5, :sort_order => 3)
ChordDefinition.create(:chord_id => 12, :scale_number => 7, :modifier => "b", :sort_order => 4)
ChordDefinition.create(:chord_id => 12, :scale_number => 9, :sort_order => 5)
ChordDefinition.create(:chord_id => 12, :scale_number => 11, :sort_order => 6)

#dominant 13
ChordDefinition.create(:chord_id => 13, :scale_number => 1, :sort_order => 1)
ChordDefinition.create(:chord_id => 13, :scale_number => 3, :sort_order => 2)
ChordDefinition.create(:chord_id => 13, :scale_number => 5, :sort_order => 3)
ChordDefinition.create(:chord_id => 13, :scale_number => 7, :modifier => "b", :sort_order => 4)
ChordDefinition.create(:chord_id => 13, :scale_number => 9, :sort_order => 5)
ChordDefinition.create(:chord_id => 13, :scale_number => 11, :sort_order => 6)
ChordDefinition.create(:chord_id => 13, :scale_number => 13, :sort_order => 7)

#half diminished
ChordDefinition.create(:chord_id => 14, :scale_number => 1, :sort_order => 1)
ChordDefinition.create(:chord_id => 14, :scale_number => 3, :modifier => "b", :sort_order => 2)
ChordDefinition.create(:chord_id => 14, :scale_number => 5, :modifier => "b", :sort_order => 3)
ChordDefinition.create(:chord_id => 14, :scale_number => 7, :modifier => "b", :sort_order => 4)

CircleStep.delete_all
CircleStep.create(:note=>"C", :sort_order=>1)
CircleStep.create(:note=>"F", :sort_order=>2)
CircleStep.create(:note=>"Bb", :sort_order=>3)
CircleStep.create(:note=>"Eb", :sort_order=>4)
CircleStep.create(:note=>"Ab", :sort_order=>5)
CircleStep.create(:note=>"Db", :sort_order=>6)
CircleStep.create(:note=>"Gb", :sort_order=>7)
CircleStep.create(:note=>"B", :sort_order=>8)
CircleStep.create(:note=>"E", :sort_order=>9)
CircleStep.create(:note=>"A", :sort_order=>10)
CircleStep.create(:note=>"D", :sort_order=>11)
CircleStep.create(:note=>"G", :sort_order=>12)

Progression.delete_all
Progression.create(:name=>"2-5-1")
Progression.create(:name=>"6-2-5-1")
Progression.create(:name=>"3-6-2-5-1")
Progression.create(:name=>"7-3-6-2-5-1")
Progression.create(:name=>"5-1-4")

ProgressionStep.delete_all
ProgressionStep.create(:progression_id => 1, :chord_symbol_id=>2, :sort_order=>1)
ProgressionStep.create(:progression_id => 1, :chord_symbol_id=>5, :sort_order=>2)
ProgressionStep.create(:progression_id => 1, :chord_symbol_id=>1, :sort_order=>3)

ProgressionStep.create(:progression_id => 2, :chord_symbol_id=>6, :sort_order=>1)
ProgressionStep.create(:progression_id => 2, :chord_symbol_id=>2, :sort_order=>2)
ProgressionStep.create(:progression_id => 2, :chord_symbol_id=>5, :sort_order=>3)
ProgressionStep.create(:progression_id => 2, :chord_symbol_id=>1, :sort_order=>4)

ProgressionStep.create(:progression_id => 3, :chord_symbol_id=>3, :sort_order=>1)
ProgressionStep.create(:progression_id => 3, :chord_symbol_id=>6, :sort_order=>2)
ProgressionStep.create(:progression_id => 3, :chord_symbol_id=>2, :sort_order=>3)
ProgressionStep.create(:progression_id => 3, :chord_symbol_id=>5, :sort_order=>4)
ProgressionStep.create(:progression_id => 3, :chord_symbol_id=>1, :sort_order=>5)

ProgressionStep.create(:progression_id => 4, :chord_symbol_id=>7, :sort_order=>1)
ProgressionStep.create(:progression_id => 4, :chord_symbol_id=>3, :sort_order=>2)
ProgressionStep.create(:progression_id => 4, :chord_symbol_id=>6, :sort_order=>3)
ProgressionStep.create(:progression_id => 4, :chord_symbol_id=>2, :sort_order=>4)
ProgressionStep.create(:progression_id => 4, :chord_symbol_id=>5, :sort_order=>5)
ProgressionStep.create(:progression_id => 4, :chord_symbol_id=>1, :sort_order=>6)

ProgressionStep.create(:progression_id => 5, :chord_symbol_id=>5, :sort_order=>1)
ProgressionStep.create(:progression_id => 5, :chord_symbol_id=>1, :sort_order=>2)
ProgressionStep.create(:progression_id => 5, :chord_symbol_id=>4, :sort_order=>3)

ChordSymbol.delete_all
ChordSymbol.create(:name=>"I", :sort_order=>1)
ChordSymbol.create(:name=>"II", :sort_order=>2)
ChordSymbol.create(:name=>"III", :sort_order=>3)
ChordSymbol.create(:name=>"IV", :sort_order=>4)
ChordSymbol.create(:name=>"V", :sort_order=>5)
ChordSymbol.create(:name=>"VI", :sort_order=>6)
ChordSymbol.create(:name=>"VII", :sort_order=>7)

#ChordGroup.create(:description => "1, 3, 5")
#ChordGroup.create(:description => "4, 6")
#ChordGroup.create(:description => "5, 7")

#ChordRelative.create(:chord_group => 1, :chord_symbol_id => 1)
#ChordRelative.create(:chord_group => 1, :chord_symbol_id => 3)

#ChordRelative.create(:chord_group => 1, :chord_symbol_id => 4)
#ChordRelative.create(:chord_group => 1, :chord_symbol_id => 6)

#ChordRelative.create(:chord_group => 1, :chord_symbol_id => 5)
#ChordRelative.create(:chord_group => 1, :chord_symbol_id => 7)

NoteType.delete_all
NoteType.create(:name => "whole", :count => "4")
NoteType.create(:name => "half", :count => "2")
NoteType.create(:name => "quarter", :count => "1")
NoteType.create(:name => "dotted half", :count => "3")
NoteType.create(:name => "dotted quarter", :count => "1.5")
NoteType.create(:name => "eighth", :count => "0.5")
NoteType.create(:name => "sixteenth", :count => "0.25" )
