#!/usr/bin/env ruby

require "http"
require "json"

$latest = false

raw = %x`pwd`
$org_and_project = raw.strip.split("/")[-2..-1].join("/")

if ARGV.size == 1 && ARGV.last == "latest"
  $latest = true
end

def repos_url(org_and_project)
  org_and_project.gsub("/", "%2F")
  "https://api.travis-ci.org/repos?slug=#{org_and_project}"
end

def builds_url(repo_id)
  "https://api.travis-ci.org/builds?event_type%5B%5D=push&event_type%5B%5D=api&repository_id=#{repo_id}"
end

def build_view_url(org_and_project, build_id)
  "https://travis-ci.org/#{org_and_project}/builds/#{build_id}"
end

def match?(build)
  if $latest
    # assume you just want the latest build, so return
    return true
  end

  branch = %x`git branch | grep "\*"`
  branch = branch.split("* ").last.strip
  return true if branch == build["branch"]

  commit = %x`git log | head -n 1 | cut -f 2 -d " "`
  return true if commit == build["commit"]

  return false
end

resp = HTTP.get(repos_url($org_and_project))

repos = JSON.parse(resp.body)

resp = HTTP.get(builds_url(repos.first["id"]))

builds = JSON.parse(resp)

builds.each do |build|
  if match?(build)
    puts build_view_url($org_and_project, build["id"])
    exit 0
  end

end

puts "No matching builds found"
exit 1
