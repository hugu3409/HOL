class Situation < ApplicationRecord

    def self.target_list
        criteria = ["欠席", "出席停止", "遅刻", "早退"]
        Situation.where(name: criteria)
    end

    def self.target_id_list
        Situation.target_list.map(&:id)
    end

end
