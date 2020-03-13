require 'mkmf'
require 'fileutils'

VERSION = File.read(File.join(__dir__, "VERSION"))
root = File.expand_path('../../..', __FILE__)

FileUtils.mkpath(File.join("vendor"))

Dir.chdir(File.join(root, 'vendor')) do
  system "wget -quiet https://xpdfreader-dl.s3.amazonaws.com/xpdf-#{VERSION}.tar.gz"
  system "tar xzf xpdf-#{VERSION}.tar.gz"
end

Dir.chdir(File.join(root, 'vendor', "xpdf-#{VERSION}")) do
  system "./configure", "--prefix=#{root}"
  system "make"
  system "make install"
  system "make clean"
end

create_makefile 'xpdf'
