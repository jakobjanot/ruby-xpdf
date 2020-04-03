# frozen_string_literal: true

require 'mkmf'
require 'pathname'

root = Pathname.new(__dir__).join('..', '..').expand_path
version = root.join('VERSION').read
xpdf_tar_file = root.join("xpdf-#{version}.tar.gz")
xpdf_src_dir = root.join("xpdf-#{version}")
download_url = "https://xpdfreader-dl.s3.amazonaws.com/old/xpdf-#{version}.tar.gz"

cmd = [
  "cd #{root}",
  "wget -q #{download_url}",
  "tar xzf #{xpdf_tar_file}",
  "cd #{xpdf_src_dir}",
  "./configure --prefix=#{root} --enable-a4-paper --without-libpaper-library --without-x --without-t1-library",
  "make",
  "make install",
  "ls"
].join(" && ")

system(cmd)

xpdf_tar_file.delete if xpdf_tar_file.exist?
xpdf_src_dir.rmtree if xpdf_src_dir.exist?

create_makefile 'xpdf'
