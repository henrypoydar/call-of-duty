require 'socket'

module CallOfDuty

  # Thanks Tom Russell
  # http://www.trdev.co.uk/posts/hello-world/
  class Cod4Server

    QUERY_TIMEOUT = 5 # maximum query of 5 seconds
    QUERY_STRING = "\xFF\xFF\xFF\xFFgetstatus\x00"

    attr_accessor :ip_address, :port
    attr_accessor :mapname, :players, :servername, :response
    attr_accessor :maxplayers, :currplayers

    def initialize(ip_address, port = "28960")
      @ip_address = ip_address
      @port = port
    end

    def query_server
      begin
        socket = UDPSocket.open
        socket.send(QUERY_STRING, 0, @ip_address, @port)
        response = if IO.select([socket], nil, nil, QUERY_TIMEOUT)
          socket.recvfrom(65536)  #wait 5 seconds to recieve 65536 bytes of data
        end
        if response
          data = response.first.split("\\")
          players_arr = data.last.split("\n")
          players_arr.shift
          @maxplayers = data[data.index("sv_maxclients")+1]
          @currplayers = players_arr.size
          @players = []
          players_arr.sort! do |a,b|
            t1 = a.split(" ")
            t2 = b.split(" ")
            t2[0].to_i <=> t1[0].to_i
          end
          players_arr.each do |player|
            p = player.split(" ")
            score = p[0]
            ping = p[1]
            p.delete_at(0)
            p.delete_at(0)
            p = p.join(" ")
            @players.push({:score => score, :ping => ping, :name => p.gsub("\"","")})
          end
          @mapname = data[data.index("mapname")+1]
          @servername = data[data.index("sv_hostname")+1]
          @response = response
        end
      rescue IOError, SystemCallError
        #TODO: something smart
      ensure 
        socket.close if socket
      end
      response ? true : false
    end

  end
end
