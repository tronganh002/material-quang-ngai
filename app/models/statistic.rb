class Statistic < ApplicationRecord
  before_save :cal_total
  belongs_to :material
  scope :by_month, ->month do
    begin_month = DateTime.new(Time.zone.now.year, month, 1).beginning_of_day
    end_month = begin_month.end_of_month.end_of_day
    where("time_input >= ? and time_input <= ?", begin_month, end_month)
  end

  def cal_total
    total = self.mass* self.price
    self.total = total
  end
end
