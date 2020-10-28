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
    } else {
      set outfile [open "/tmp/DTMF" w]
      puts $outfile "DTMF OFF"
      close $outfile
    }
    return 1
  }