class Situation < ApplicationRecord

    KESSEKI = Situation.find_by(name: "欠席")
    SYUTTEI = Situation.find_by(name: "出席停止")
    CHIKOKU = Situation.find_by(name: "遅刻")
    SOUTAI  = Situation.find_by(name: "早退")


    TARGET_LIST = [
        KESSEKI,
        SYUTTEI,
        CHIKOKU,
        SOUTAI
    ]

    TARGET_ID_LIST = TARGET_LIST.map(&:id)
end
