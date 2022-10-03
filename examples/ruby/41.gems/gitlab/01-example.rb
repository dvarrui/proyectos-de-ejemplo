#!/usr/bin/env ruby

require "dotenv"
require "gitlab"
require "debug"

Dotenv.load("./.env")
endpoint = ENV['GITLAB_API_ENDPOINT']
private_token = ENV['GITLAB_API_PRIVATE_TOKEN']

binding.break

g = Gitlab.client(
  endpoint: endpoint,
  private_token: private_token,
)

user = g.user
puts user
