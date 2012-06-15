desc "Uploading search engines"
task :upload_servers=>:environment do
  yml = YAML::load(File.read("#{Rails.root}/config/bootstrap/search_servers.yml"))
  yml.each do|server,opts|
    p opts
    SearchServer.create(opts)
  end
end
