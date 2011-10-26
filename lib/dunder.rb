require "pethau"

class Object
  include Pethau::InitializeWith
  include Pethau::DefaultValueOf
  include Pethau::PrivateAttrAccessor
end

require "logger"
require "optparse"
require "ostruct"

require "latte"
require "dns/zonefile"

require "dunder/version"
require "dunder/resolver"
require "dunder/command_line"

module Dunder
end
