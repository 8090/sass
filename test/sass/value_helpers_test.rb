#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../test_helper'

class ValueHelpersTest < Test::Unit::TestCase
  include Sass::Script
  include Sass::Script::Value::Helpers

  def test_bool
    assert_same Value::Bool::TRUE, bool(true)
    assert_same Value::Bool::FALSE, bool(false)
    assert_same Value::Bool::FALSE, bool(nil)
    assert_same Value::Bool::TRUE, bool(Object.new)
  end

  def test_hex_color
    color_without_hash = hex_color("FF007F")
    assert_equal 255, color_without_hash.red
    assert_equal 0, color_without_hash.green
    assert_equal 127, color_without_hash.blue
    assert_equal 1, color_without_hash.alpha

    color_with_hash = hex_color("#FF007F")
    assert_equal 255, color_with_hash.red
    assert_equal 0, color_with_hash.green
    assert_equal 127, color_with_hash.blue
    assert_equal 1, color_with_hash.alpha

    color_with_alpha = hex_color("FF007F", 0.5)
    assert_equal 0.5, color_with_alpha.alpha

    assert_raises ArgumentError do
      hex_color("FF007F", 50)
    end
  end

  def test_hsl_color
    no_alpha = hsl_color(1, 0.5, 1)
    assert_equal 1, no_alpha.hue
    assert_equal 0.5, no_alpha.saturation
    assert_equal 1, no_alpha.lightness
    assert_equal 1, no_alpha.alpha

    has_alpha = hsl_color(1, 0.5, 1, 0.5)
    assert_equal 1, has_alpha.hue
    assert_equal 0.5, has_alpha.saturation
    assert_equal 1, has_alpha.lightness
    assert_equal 0.5, has_alpha.alpha
  end
end
