name             "rebar"
maintainer       "Opscode, Inc."
maintainer_email "cookbooks@opscode.com"
license          "Apache 2.0"
description      "Installs rebar, the Erlang build tool"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

recipe           "rebar", "Installs rebar, the Erlang build tool"

depends "git"
depends "erlang"
