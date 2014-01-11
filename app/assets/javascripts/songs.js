$(document).on('ready page:load', function(){

  MIDI.loadPlugin({
    soundfontUrl: "../../assets/soundfont/",
    instrument: "acoustic_grand_piano"
  });

  $('a#play_song').on('click', function(){
    position_notes = $('#all-notes').data('notes')

    $(position_notes).each(function(i){
      playChord(this, 0.75*i)
    });
  });

  $('a#play_chord').on('click', function(){
    notes = $(this).data('notes')
    playChord(notes, 0)
  });

});

function playChord(chord, delay){
  var channel = 0,
      chord = $(chord).map(function(note){
        return MIDI.keyToNote[this]
      }),
      velocity = 127;

  MIDI.setVolume(0, 127);
  MIDI.chordOn(channel, chord, velocity, delay);
  MIDI.chordOff(channel, chord, delay + 0.75);
}