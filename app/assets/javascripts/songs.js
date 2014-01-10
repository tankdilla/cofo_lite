$(document).on('ready page:load', function(){

  MIDI.loadPlugin({
    soundfontUrl: "../../assets/soundfont/",
    instrument: "acoustic_grand_piano",
    callback: function() { }
  });
  
  $('a#playnote').on('click', function(){
    position_notes = $('#all-notes').data('notes')
    
    $(position_notes).each(function(i){

      var channel = 0,
          chord = $(this).map(function(note){
            return MIDI.keyToNote[this]
          }),
          velocity = 127,
          delay = 1;
      
      MIDI.setVolume(0, 127);
      MIDI.chordOn(channel, chord, velocity, delay);
      MIDI.chordOff(channel, chord, delay + 0.75);
      $(this).delay(1000*i)
    });
      
  });

});
4