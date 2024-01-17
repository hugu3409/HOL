class Situation < ApplicationRecord

    def self.target_list
        criteria = ["欠席", "出席停止", "遅刻", "早退", "不明"]
        Situation.where(name: criteria)
    end

    def self.target_id_list
        Situation.target_list.map(&:id)
    end

    def self.syuttei
        Situation.find_by(name: "出席停止")
    end

    def fumei?
        id == Situation.find_by(name: "不明").id
    end

end
