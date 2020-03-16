require 'mkmf'
require 'pathname'

root = Pathname.new(__dir__).join("..", "..").expand_path
version = root.join("VERSION").read
xpdf_tar_file = root.join("xpdf-#{version}.tar.gz")
xpdf_src_dir = root.join("xpdf-#{version}")

Dir.chdir(root) do
  system "wget -q https://xpdfreader-dl.s3.amazonaws.com/old/xpdf-#{version}.tar.gz && "\
    "tar xzf #{xpdf_tar_file}"
end

Dir.chdir(xpdf_src_dir) do
  system "./configure --prefix=#{root} --enable-a4-paper --without-libpaper-library --without-x --without-t1-library && make install"
end

xpdf_tar_file.delete if xpdf_tar_file.exist?
xpdf_src_dir.rmtree if xpdf_src_dir.exist?

create_makefile 'xpdf'
