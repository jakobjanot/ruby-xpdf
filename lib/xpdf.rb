require 'pathname'

module Xpdf
  Bin = Pathname.new(__dir__).join('..', 'bin').expand_path
  Executables = Bin.children.inject({}) { |h, p|
    h[p.basename.to_s.to_sym] = p.to_s
    h
  }
end
