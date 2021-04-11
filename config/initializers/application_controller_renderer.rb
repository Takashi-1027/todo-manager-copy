# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end

# RuntimeError (in Users#show)を解決するためのRefile.secret_keyである。
Refile.secret_key = 'de94c37acffdaa54abc09957f8db8bd44fa29690043fa5c7b26dea4b9e6c96e386bb15afd410b65ad818b9b20e064cf2c1f39f62b604590db82ff3ce93cbd5a6'