default[:leiningen][:install_script] = "https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein"
default[:rbenv][:user_installs] = [{user: 'vagrant', rubies: ["2.1.5"], global: "2.1.5", gems: {"2.1.5" => [{ name: "bundler" } ] } }]
default[:anaconda][:version] = '2.1.0'
default[:anaconda][:flavor] = 'x86_64'
default[:anaconda][:accept_license] = 'yes'
default[:anaconda][:installer]['2.1.0']['x86_64'] = '191fbf290747614929d0bdd576e330c944b22a67585d1c185e0d2b3a3e65e1c0'
default[:java][:install_flavor] = 'oracle'
default[:java][:jdk_version] = '7'
default[:java][:oracle][:accept_oracle_download_terms] = true
