  # Timersalon controler
  if {$cmd == "111"} {
    if { [file exists /tmp/TIMER] } {
      file delete -force /tmp/TIMER
      exec nohup /etc/spotnik/timersalon.sh &
      playFile /usr/share/svxlink/sounds/fr_FR/RRF/timer_on.wav
    } else {
      set outfile [open "/tmp/TIMER" w]
      puts $outfile "TIMER OFF"
      close $outfile
      exec /usr/bin/pkill -f timersalon
      playFile /usr/share/svxlink/sounds/fr_FR/RRF/timer_off.wav
    }
    return 1
  }