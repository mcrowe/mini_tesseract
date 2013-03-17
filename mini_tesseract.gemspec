# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mini_tesseract/version'

Gem::Specification.new do |spec|
  spec.name          = "mini_tesseract"
  spec.version       = MiniTesseract::VERSION
  spec.authors       = ["Mitch Crowe"]
  spec.email         = ["crowe.mitch@gmail.com"]
  spec.description   = %q{Mini ruby wrapper around the Tesseract OCR engine}
  spec.summary       = %q{Mini ruby wrapper around the Tesseract OCR engine}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "rmagick", ">= 2.10.1"
end
