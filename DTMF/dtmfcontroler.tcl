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
      exec /opt/RRFSpeech.sh " Commande D T M F, activée"
      playFile /tmp/out.wav
    } else {
      set outfile [open "/tmp/DTMF" w]
      puts $outfile "DTMF OFF"
      close $outfile
      exec /opt/RRFSpeech.sh " Commande D T M F, désactivée"
      playFile /tmp/out.wav
    }
    return 1
  }