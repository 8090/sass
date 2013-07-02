module Sass::Script::Value
  # Provides helper functions for creating sass values from within ruby methods
  module Helpers

    # Construct a Sass Boolean value.
    #
    # This method returns boolean constants instead of creating a new value object
    # with each call.
    #
    # @since `3.3.0`
    # @return [Sass::Script::Value::Bool] whether the ruby value is truthy.
    def bool(value)
      Bool.new(value)
    end

    # Construct a Sass Color from a hex color string.
    #
    # @since `3.3.0`
    # @param value [::String] A string representing a hex color.
    #                         The leading hash ("#") is optional.
    # @param alpha [::Number] The alpha channel. A number between 0 and 1.
    # @return [Sass::Script::Value::Color] the color object
    def hex_color(value, alpha = nil)
      Color.from_hex(value, alpha)
    end
  end
end
