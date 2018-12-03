puts "Create Materials"
["Giấy cuộn", "Bột mì", "Phụ gia hồ", "Mực in"].each do |name|
  Material.create(name: name)
end

puts "Create Revenues"
["3 lớp kích thước 40 x 30 x 10", "3 lớp kích thước 40 x 30 x 20", "3 lớp kích thước 45 x 30 x 25",
  "5 lớp kích thước 90 x 50 x 30", "5 lớp kích thước 60 x 50 x 50", "5 lớp kích thước 80 x 50 x 40",
  "7 lớp kích thước 80 x 70 x 35", "7 lớp kích thước 90 x 70 x 50", "7 lớp kích thước 95 x 70 x 60"
].each do |name|
  Material.create(name: name, type_mt: :revenue_type)
end
