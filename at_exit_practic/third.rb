console_read_data = ""

at_exit { puts console_read_data }
at_exit { console_read_data = ARGV[0] }