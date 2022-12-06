# frozen_string_literal: true

Pod::Spec.new do |s|
  s.name          = 'NSObject-SafeExpectations'
  s.version       = '0.0.5'

  s.summary       = 'No more crashes getting unexpected values from a NSDictionary.'
  s.description   = <<-DESC
                    This micro-library exposes an NSDictionary category which ensures that the value for the queried key is of the expected type before returning it (and returns nil otherwise).
                    This ensures we don't get unexpected types when looking up values from our NSDictionary which would lead to runtime crashes.
  DESC

  s.homepage      = 'https://github.com/wordpress-mobile/NSObject-SafeExpectations'
  s.license       = { type: 'MIT', file: 'LICENSE' }
  s.author        = { 'The WordPress Mobile Team' => 'mobile@wordpress.org' }

  s.platform      = :ios, '11.0'

  s.source        = { git: 'https://github.com/wordpress-mobile/NSObject-SafeExpectations.git', tag: s.version.to_s }
  s.source_files  = 'Sources/NSObject-SafeExpectations/*.{h,m}'

  s.test_spec do |test|
    test.source_files = 'Tests/AllTests/*.{h,m}'
  end
end
