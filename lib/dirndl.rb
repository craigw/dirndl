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

require "dirndl/version"
require "dirndl/resolver"
require "dirndl/command_line"

module Dirndl
end
