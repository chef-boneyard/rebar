#
# Cookbook Name:: rebar
# Recipe:: default
#
# Copyright 2013, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "git"
include_recipe "erlang"

package "make"

# Clone the code and trigger a build
git "fetch_rebar" do
  destination node[:rebar][:build_dir]
  repository node[:rebar][:repository]
  revision node[:rebar][:version]
  notifies :run, "execute[build_rebar]", :immediately
end

# Actually build the software
execute "build_rebar" do
  command "make"
  cwd node[:rebar][:build_dir]
  action :nothing
end

# Ensure the executable is actually executable
file "#{node[:rebar][:build_dir]}/rebar" do
  action :touch
  mode "0755"
end

# Link the executable to its final location (preferably somewhere that
# will show up in your $PATH!)
link "link_rebar" do
  to "#{node[:rebar][:build_dir]}/rebar"
  target_file node[:rebar][:link_to]
  owner node[:rebar][:owner]
  group node[:rebar][:group]
end
