#!/usr/bin/env ruby
require 'test/unit'
require 'fileutils'

class SetupChefTest < Test::Unit::TestCase
  def test_prompts
    assert_equal 'foo', sc(['foo']).readlines.first.strip
  end

  def sc(args)
    cmd = 'sh setup_chef ' + args.join(' ')
    FileUtils.cd(File.dirname(__FILE__) + '/..') do
      return IO.popen(cmd)
    end
  end
end