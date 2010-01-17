#!/usr/bin/env ruby
require 'test/unit'
require 'fileutils'

class SetupChefTest < Test::Unit::TestCase
  def test_help
    assert_match /Usage/, runit([], ['--help']).readlines.first
  end

  def runit(input, args = [])
    cmd = 'sh setup_chef ' + args.join(' ')
    FileUtils.cd(File.dirname(__FILE__) + '/..') do
      return IO.popen(cmd)
    end
  end
end