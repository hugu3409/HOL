class Attendance < ApplicationRecord
    belongs_to :situation
    belongs_to :student    #joinsと関係するよー
    
    validates :date, uniqueness: { scope: :student_id }

    def student_name_and_reazon
        "#{self.student.name}(#{self.reason})" if self.id.present?
    end

    def period
        period_start = I18n.l(self.period_start, format: :short) if self.period_start.present?
        period_end = I18n.l(self.period_end, format: :short) if self.period_end.present?
        separator = "～" if (period_start || period_end)
        "#{period_start}#{separator}#{period_end}"
    end
end
