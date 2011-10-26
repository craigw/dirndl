module Dunder
  class CommandLine
    initialize_with :arguments

    def parse_arguments
      parsed = { addresses: [] }
      OptionParser.new do |o|
        o.on '-l', '--listen ADDRESS', 'Serve DNS on this address' do |addr|
          address = Latte::Address.new addr
          parsed[:addresses] << address
          parsed[:addresses].uniq!
        end

        o.on '-z', '--zone-db PATH', 'Path to the root of the zone db' do |path|
          parsed[:zone_db] = path
        end

        o.separator ''
        o.separator 'Common options:'

        o.on_tail '-h', '--help', 'Show this message' do
          puts o
          exit
        end

        o.on_tail '--version', 'Show version' do
          puts Dunder::VERSION
          exit
        end
      end.parse arguments
      OpenStruct.new parsed
    end

    def execute
      arguments = parse_arguments
      resolver = Resolver.new arguments.zone_db
      logger = Logger.new STDOUT
      server = Latte::Server.new resolver, logger
      server.listen_on *arguments.addresses
      server.run
    end
  end
end
