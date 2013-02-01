rebar cookbook
==============

This cookbook will install `rebar`, the build tool for Erlang.

It clones the source code from a Git repository (defaulting to
[Basho's canonical repo](https://github.com/basho/rebar)), builds the software, and then links
the executable to its final location.

Requirements
============

* [git][] - for fetching the source code for `rebar`
* [erlang][] - for building `rebar`

[git]:https://github.com/opscode-cookbooks/git
[erlang]:https://github.com/opscode-cookbooks/erlang

Usage
=====

Add `rebar::default` to your run list, or add `include_recipe "rebar"`
to a recipe.

Attributes
==========

* `node[:rebar][:repository]` - Git repository address to clone from.
  Defaults to the canonical repo from Basho.
* `node[:rebar][:version]` - Git tag, branch, or SHA1 to checkout.
* `node[:rebar][:build_dir]` - Directory the source code will be `git
  clone`d to.  The default is `/usr/local/src/rebar`; here, the
  directory `/usr/local/src` must exist already, and the `rebar`
  directory will contain the Git checkout.
* `node[:rebar][:link_to]` - The full path for where you would like
  the `rebar` executable to be linked to.  Defaults to
  `/usr/local/bin/rebar`
* `node[:rebar][:owner]` - The owner of both the source code checkout
  and the `rebar` executable.
* `node[:rebar][:group]` - The group of both the source code checkout

Recipes
=======

* `rebar::default` - Builds `rebar` from source and links the
  executable to its desired final location.

Author
======

- Author:: Christopher Maier (<cm@opscode.com>)

License
=======

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
