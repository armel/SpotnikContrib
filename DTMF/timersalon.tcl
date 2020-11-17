  # Timersalon controler
  if {$cmd == "111"} {
    if { [file exists /tmp/TIMER] } {
      file delete -force /tmp/TIMER
      exec nohup /etc/spotnik/timersalon.sh &
      exec /opt/RRFSpeech/RRFSpeech.sh " Taille meurt salon, activée"
      playFile /tmp/out.wav
    } else {
      set outfile [open "/tmp/TIMER" w]
      puts $outfile "TIMER OFF"
      close $outfile
      exec /usr/bin/pkill -f timersalon
      exec /opt/RRFSpeech/RRFSpeech.sh " Taille meurt salon, désactivée"
      playFile /tmp/out.wav
    }
    return 1
  }