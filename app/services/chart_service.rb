class ChartService
  def self.data_set(tab)
    tab = "material_type" unless tab.present?
    month_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    month_hash = month_arr.map{|m| "Tháng #{m}"}
    if tab.to_sym == :revenue_type || tab.to_sym == :material_type
      materials = Material.where(type_mt: tab.to_sym)
      statistics = Statistic.where(material_id: materials.pluck(:id))
      data = {}
      data[:labels] = month_hash
      data[:datasets] = materials.map do |material|
        data_set = {}
        rgba_color = Faker::Color.rgb_color
        rgb_color = Faker::Color.rgb_color
        data_set[:backgroundColor] = "rgba(#{rgba_color.first}, #{rgba_color.second}, #{rgba_color.last}, 0.1)"
        data_set[:borderColor] = "rgb(#{rgb_color.first}, #{rgb_color.second}, #{rgb_color.last})"
        data_set[:label] = material.name
        data_set[:data] = month_arr.map do |m|
          material.statistics.by_month(m).sum(:price)
        end
        data_set
      end
      data
    else
      materials = Material.material_type
      statistics = Statistic.where(material_id: materials.pluck(:id))
      materials_name = ["Chi Phí NVL", "Doanh thu"]
      data = {}
      data[:labels] = month_hash
      data_set = {}
      rgba_color = Faker::Color.rgb_color
      rgb_color = Faker::Color.rgb_color
      data_set[:backgroundColor] = "rgba(#{rgba_color.first}, #{rgba_color.second}, #{rgba_color.last}, 0.1)"
      data_set[:borderColor] = "rgb(0,0,255)"
      data_set[:label] = "Chi Phí NVL"
      data_set[:data] = month_arr.map do |m|
        statistics.by_month(m).sum(:price)
      end
      data[:datasets] = [data_set]

      materials = Material.revenue_type
      statistics = Statistic.where(material_id: materials.pluck(:id))
      data_set = {}
      rgba_color = Faker::Color.rgb_color
      rgb_color = Faker::Color.rgb_color
      data_set[:backgroundColor] = "rgba(#{rgba_color.first}, #{rgba_color.second}, #{rgba_color.last}, 0.1)"
      data_set[:borderColor] = "rgb(255,0,0)"
      data_set[:label] = "Doanh thu"
      data_set[:data] = month_arr.map do |m|
        statistics.by_month(m).sum(:price)
      end
      data[:datasets] = data[:datasets] << data_set
      data
    end
  end
end
