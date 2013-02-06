Pod::Spec.new do |s|
  s.name         = "NSObject-SafeExpectations"
  s.version      = "0.0.1"
  s.summary      = "No more crashes getting unexpected values from a NSDictionary."
  s.homepage     = "https://github.com/koke/NSObject-SafeExpectations"
  s.license      = { :name => 'MIT', :file => 'LICENSE' }
  s.author       = { "Jorge Bernal" => "jbernal@gmail.com" }
  s.source       = { :git => "https://github.com/koke/NSObject-SafeExpectations.git" }
  s.source_files = '*.{h,m}'
end
