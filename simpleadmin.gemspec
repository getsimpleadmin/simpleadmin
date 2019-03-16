$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'simpleadmin/version'

Gem::Specification.new do |spec|
  spec.name        = 'simpleadmin'
  spec.version     = Simpleadmin::VERSION
  spec.authors     = ['Dmitriy Strukov']
  spec.email       = ['dmitriy.strukov@outlook.com']

  spec.homepage    = 'https://getsimpleadmin.com'
  spec.summary     = 'SimpleAdmin - Dashboard for modern applications without wasting time'
  spec.description = 'SimpleAdmin - Dashboard for modern applications without wasting time'

  spec.license     = 'MIT'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '>= 5.0.6'
end
