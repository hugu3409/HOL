class Attendance < ApplicationRecord
    belongs_to :situation
    belongs_to :student
end
