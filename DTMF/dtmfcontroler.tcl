  # DTMF controler  
  if { [file exists /tmp/DTMF] } {
    if {$cmd != "999"} {
      return 1
    }
  }

  # DTMF controler
  if {$cmd == "999"} {
    if { [file exists /tmp/DTMF] } {
      file delete -force /tmp/DTMF
      playSilence 1500
      playFile /usr/share/svxlink/sounds/fr_FR/RRF/dtmf_on.wav
    } else {
      set outfile [open "/tmp/DTMF" w]
      puts $outfile "DTMF OFF"
      close $outfile
      playSilence 1500
      playFile /usr/share/svxlink/sounds/fr_FR/RRF/dtmf_off.wav
    }
    return 1
  }