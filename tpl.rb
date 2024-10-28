# convert =  DeviceNameConvert.pluck(:device_name,:convert_device_name).to_h
# result = {}
# convert.values.uniq.each do |v|
#     keys =   convert.select{|key,val| val == v}.keys
#     temp =  IotDeviceTs.group(:deviceName).count.select{|item,count| keys.include?(item) }.values.sum
#     result[v] = temp
# end
# puts  result


last_7_days = (0..6).map { |i| (Date.today - i).to_s }
last_7_days.each do |item|
    AlarmInfo.where("alarmTime >= ? and alarmTime <= ?",)
end



