Gem::Specification do |s|
  s.name        = 'jekyll-code-example-tag'
  s.version     = '0.0.1'
  s.date        = '2015-02-03'
  s.authors     = ['GovDelivery']
  s.email       = 'support@govdelivery.com'
  s.homepage    = 'http://govdelivery.com'
  s.license     = 'BSD-3-Clause'
  s.summary     = 'Tags for including code examples in posts and pages.'
  s.description = %q{Provides a tag that allows you to include in your posts 
                     and pages code examples for multiple langagues that are 
                     kept in seperate files. Another tag allows you to combine
                     all code examples that are on a page.}

  s.add_dependency 'jekyll'

  s.files        = `git ls-files`.split($\)
  s.require_paths = ['lib']
end
