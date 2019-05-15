my_core_data = "Original value\n"

at_exit do
  puts my_core_data 
  my_core_data = "Value from first handler\n" 
end

at_exit do 
  puts my_core_data 
  my_core_data = "Second handler was here\n"
end

print("Var value at app code: ")
print(my_core_data)
