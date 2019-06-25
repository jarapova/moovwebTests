address = "0.2.21.11.8.0.6.1.0.1.0.0"


  array = address.split(".")
  for i in array
  print "/*[#{i.to_i + 1}]"
  end


  # array = address.split("/*[")
  # for i in array
  #   next if i == array[0]
  #   print "#{(i[0...-1]).to_i - 1}."
  # end
# run command in cmd: ruby test/specs/test_scenario/yourtest.rb


# Xpathtest/specs/test_scenario/yourtest.rb - place, where this test present
