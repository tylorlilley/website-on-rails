source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.8'

gem 'rails',                      '6.1.4'
gem 'haml',                       '5.1.2'
gem 'aws-sdk-s3',                 '1.46.0', require: false
gem 'image_processing',           '1.9.3'
gem 'mini_magick',                '4.9.5'
gem 'active_storage_validations', '0.8.2'
gem 'bcrypt',                     '3.1.13'
gem 'faker',                      '2.1.2'
gem 'will_paginate',              '3.1.8'
gem 'bootstrap-will_paginate',    '1.0.0'
gem 'bootstrap',                  '= 4.3.1'
gem 'puma',                       '4.3.9'
gem 'sass-rails',                 '5.1.0'
gem 'coffee-rails',               '5.0.0'
gem 'webpacker',                  '5.2.2'
gem 'turbolinks',                 '5.2.0'
gem 'jbuilder',                   '2.9.1'
gem 'psych',                      '3.3.2'
gem 'concurrent-ruby',            '1.3.4'

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'byebug',  '12.0', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console',           '4.0.1'
  gem 'listen',                '3.7.0'
  gem 'spring',                '2.1.1'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'capybara',                 '3.28.0'
  gem 'selenium-webdriver',       '3.142.4'
  gem 'webdrivers',               '4.1.2'
  gem 'rails-controller-testing', '1.0.4'
  gem 'minitest',                 '5.11.3'
  gem 'minitest-reporters',       '1.3.8'
  gem 'guard',                    '2.19'
  gem 'guard-minitest',           '2.4.6'
end

group :production do
  gem 'pg', '1.5'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
