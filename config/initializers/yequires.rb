
Dir["#{Rails.root}/lib/*.rb", "#{Rails.root}/lib/**/*.rb"].each do |f|
  next if !File.exists?(f) || File.directory?(f)
  require f
end