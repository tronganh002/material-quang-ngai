class Statistic < ApplicationRecord
  before_save :cal_total

  def cal_total
    total = self.mass* self.price
    self.total = total
  end
end
