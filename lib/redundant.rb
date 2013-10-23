class Redundant
  def self.search(args=nil)
    puts "Searching for redundant assets"

    path = args || Dir.pwd

    puts path

    assets = self.findAssets(path);
    puts "Existing Assets: #{assets.size}"

    checkFolders = ['assets/stylesheets', 'assets/javascripts', 'helpers', 'views']

    checkFolders.each do |folder|
      if (File.directory?("#{path}/app/#{folder}"))
        Find.find("#{path}/app/#{folder}").each do |file|
         if (File.file?(file) && file !~ /\.DS_Store/)
            file_contents = File.open(file, "r")
            data = file_contents.read
            file_contents.close

            data.scan(/\/assets\/(.*?\.(jpg|jpeg|png|gif|webp))/i).each do |image|
              assets.delete("/app/assets/images/#{image.first}")
            end

            data.scan(/image_tag.*?"(.*?)"/).each do |image|

              assets.delete("/app/assets/images/#{image.first}")
            end

          end
        end
      else
        puts "The directory #{path}/app/#{folder} does not exist"
      end
    end

    puts "==============================="
    puts "Unused Assets (#{assets.size})"
    puts "==============================="

    assets.each do |asset|
      puts asset
    end

    return ""
  end

  def self.findAssets(path)
    require 'find'


    assets = []

    if File.directory? "#{path}/app/assets/images/"
      Find.find("#{path}/app/assets/images/").each do |asset|
        assets.push asset.gsub(/#{path}/, '') if asset.match(/(png|jpg|jpeg|gif|webp)/i)
      end
    else
      puts "Can't find an assets image directory (#{path}/app/assets/images/)"
    end
    return assets
  end


end
