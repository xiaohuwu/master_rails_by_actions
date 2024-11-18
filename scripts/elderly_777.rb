def extract_birthday(id_number)
    puts "id_number.length:#{id_number.length}"
    if id_number.length == 18
        year = id_number[6..9]
        month = id_number[10..11]
        if month.to_i == 0
            month = "01"
        else
            month = month
        end
        day = id_number[12..13]
        "#{year}-#{month}-#{day}"
    elsif id_number.length == 15
        year = "19" + id_number[6..7]
        month = id_number[8..9]
        day = id_number[10..11]
        "#{year}-#{month}-#{day}"
    else
        ""
    end
end

def get_gender(id_number)
    # 判断身份证号长度是否为18位
    if id_number.length != 18
        return "无效身份证号"
    end

    # 获取倒数第二位（第17位）的数字
    gender_digit = id_number[-2].to_i # 第17位（索引16）

    # 判断奇偶
    if gender_digit % 2 == 0
        return "女"
    else
        return "男"
    end
end

infile = "./scripts/跃进.xls"
file = Spreadsheet.open(infile)
sheet = file.worksheet 0
sheet.each_with_index do |row, index|
    # puts "row:#{row}"
    next if index == 0 || row[0].blank?
    identify_sn = row[0]&.strip
    puts "identify_sn:#{identify_sn}"
    birthday = extract_birthday(identify_sn)
    puts "birthday:#{birthday}"
    elderly = Elderly.where({ ID_NO: identify_sn })
    if elderly.blank?
        Elderly.create!({ ID_NO: identify_sn,
                          BIRTHDAY: birthday,
                          DATA_STATUS: 1,
                          SEX: get_gender(identify_sn),
                          UPDATE_DT: Time.now })
    else
        elderly.update({ BIRTHDAY: birthday,
                         DATA_STATUS: 1,
                         SEX: get_gender(identify_sn), })
    end

end