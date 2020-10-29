#!/usr/bin/ruby

File.open("png_dimensions.csv", "w") do |csv|
    csv.puts "filename,width,height"
    Dir.glob("../../src/resources/*.png") do |file|
        # PNG file size: https://stackoverflow.com/a/2450931/4737417
        dimensions = IO.read(file)[0x10..0x18].unpack("NN")
        csv.puts "#{File.basename(file)},#{dimensions[0]},#{dimensions[1]}"
    end
end
