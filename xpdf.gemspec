VERSION = File.read(File.join(__dir__, "VERSION"))

Gem::Specification.new do |s|
  s.name    = 'xpdf'
  s.version = VERSION
  s.summary = 'Xpdf Ruby Wrapper'
  s.authors = 'Jakob Kofoed Janot'
  s.description = 'Hack to get pdftotext, pdfinfo etc. installed'
  s.email = 'jakob.janot@karnovgroup.com'
  s.homepage = 'http://www.karnovgroup.com'
  s.licenses = ['GPL-2.0', 'GPL-3.0']

  s.files = ['lib/xpdf.rb', 'VERSION']
  s.extensions = ['ext/xpdf/extconf.rb']
end
