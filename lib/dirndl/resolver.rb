module Dirndl
  class Resolver
    initialize_with :zone_db_root_path

    def call query, response
      zone = load_zone_for query.human_qname
      return unless zone
      zone.records_of(DNS::Zonefile::A).each do |rr|
        next unless rr.host == query.human_qname
        answer = "#{rr.host} #{rr.klass} A #{rr.ttl} #{rr.address}"
        response.add answer
      end
    end

    def load_zone_for qname
      parts = qname.split /\./
      parts.reverse!
      zone_file_path = parts.inject(zone_db_root_path) { |path, part|
        file = File.join path, "#{part}.zone"
        if File.exists? file
          file
        else

          if path !~ /\.zone$/
            File.join path, part
          else
            path
          end
        end
      }
      return unless zone_file_path =~ /\.zone$/
      DNS::Zonefile.load File.read(zone_file_path)
    end
  end
end
