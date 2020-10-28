  # 111 Kill timersalon
  if {$cmd == "111"} {
    puts "Executing external command"
    exec /usr/bin/pkill -f timersalon
    return 1
  }