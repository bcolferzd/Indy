$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'indy/version'

Gem::Specification.new do |s|
  s.name        = 'indy'
  s.version     = ::Indy::VERSION
  s.authors     = ["Franklin Webber","Brandon Faloona"]
  s.description = %{ Indy is a log archaeology library that treats logs like data structures. Search standard or custom log formats by field and/or time. }
  s.summary     = "indy-#{s.version}"
  s.email       = 'brandon@faloona.net'
  s.homepage    = "http://github.com/bfaloona/Indy"
  s.license     = 'MIT'

  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.8.7'
  s.add_dependency('activesupport', '~> 3.1.12')

  s.add_development_dependency('rake', '~> 10.4.0')
  s.add_development_dependency('i18n', '~> 0.6.11')
  s.add_development_dependency('cucumber', '~> 1.3.20')
  s.add_development_dependency('yard', '~> 0.8.7.6')
  s.add_development_dependency('rspec', '~> 3.4.0')
  s.add_development_dependency('rspec-mocks', '~> 3.4.0')
  s.add_development_dependency('rb-fsevent', '~> 0.9.0')
  s.add_development_dependency('ruby_gntp', '~> 0.3.0')
  s.add_development_dependency('growl', '~> 1.0.0')

  unless ENV['TRAVIS'] == 'true'
    s.add_development_dependency('yard-cucumber', '~> 2.3.0')
    s.add_development_dependency('flog', '~> 4.3.0')
    s.add_development_dependency('guard', '~> 1.8.0')
    unless ENV['RUBY_VERSION'] &&  ENV['RUBY_VERSION'].match(/jruby|rbx/)
      s.add_development_dependency('guard-rspec', '~> 1.2.0')
      s.add_development_dependency('guard-cucumber', '~> 1.5.0')
      s.add_development_dependency('ruby-prof', '~> 0.13.0')
      s.add_development_dependency('rspec-prof', '~> 0.0.0')
      s.add_development_dependency('simplecov', '~> 0.11.0')
    end
  end

  changes = Indy.show_version_changes(::Indy::VERSION)

  s.post_install_message =
  %{
    [<>] [<>] [<>] [<>] [<>] [<>] [<>] [<>] [<>] [<>] [<>] [<>] [<>] [<>] [<>]

    Thank you for installing Indy #{::Indy::VERSION} / #{changes[:date]}.

    Changes:
    #{changes[:changes].collect{|change| "  #{change}"}.join("")}
    Please find examples at https://github.com/bfaloona/Indy#readme
    [<>] [<>] [<>] [<>] [<>] [<>] [<>] [<>] [<>] [<>] [<>] [<>] [<>] [<>] [<>]

  }

  exclusions          = [File.join("performance", "large.log")]
  s.files             = `git ls-files`.split("\n") - exclusions
  s.test_files       = `git ls-files -- {spec,features,performance}/*`.split("\n")

  s.extra_rdoc_files  = ["README.md", "History.txt"]
  s.rdoc_options      = ["--charset=UTF-8"]
  s.require_path      = "lib"
end
