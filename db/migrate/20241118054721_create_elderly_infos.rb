class CreateElderlyInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :elderly_infos do |t|
      t.string :name,comment:"姓名"
      t.string :identity_sn, comment:"身份证号"
      t.string :phone, comment:"联系电话"
      t.string :community, comment:"社区"
      t.date :birthday, comment:"出生日期"
      t.string :sex, comment:"性别"
      t.timestamps
    end
  end
end
