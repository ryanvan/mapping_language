$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mapping_language/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mapping_language"
  s.version     = MappingLanguage::VERSION
  s.authors     = ["范智锋"]
  s.email       = ["gzfanzhifeng@corp.netease.com"]
  s.homepage    = ""
  s.summary     = ""
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
end
