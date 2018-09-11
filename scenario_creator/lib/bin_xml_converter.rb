class BinXMLConverter
  def self.bin_to_xml(full_path_to_bin)
    file_name = File.basename(full_path_to_bin)
    Dir.chdir(TS_dir)
    FileUtils.mkdir(Temp_dir) unless Dir.exist?(Temp_dir)
    FileUtils.cp(full_path_to_bin, Temp_dir)
    system("serz.exe #{Temp_dir/file_name} /xml:#{Temp_dir/file_name.gsub('.bin','.xml')}")
    Temp_dir/file_name.gsub('.bin','.xml')
  end

  def self.xml_to_bin(full_path_to_xml)
    raise 'check!'
    file_name = File.basename(full_path_to_xml)
    Dir.chdir(TS_dir)
    FileUtils.mkdir(Temp_dir) unless Dir.exist?(Temp_dir)
    FileUtils.cp(full_path_to_xml, Temp_dir)
    system("serz.exe #{Temp_dir/file_name} /bin:#{Temp_dir/file_name.gsub('.xml','.bin')}")
  end
end