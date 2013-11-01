require 'spec_helper'

describe CallOfDuty::Cod4Server do

  #TODO: exceptions

  describe "#query_server" do

    before do
      UDPSocket.stub(:open).and_return(
        double(:socket,
          send: true,
          close: true,
          recvfrom: 
["statusResponse\n\\fs_game\\mods/nyc\\g_compassShowEnemies\\0\\g_gametype\\dm\\gamename\\Call of Duty 4\\mapname\\mp_bloc\\protocol\\6\\shortversion\\1.7\\sv_allowAnonymous\\0\\sv_disableClientConsole\\0\\sv_floodprotect\\4\\sv_hostname\\Kahntax COD\\sv_maxclients\\24\\sv_maxPing\\0\\sv_maxRate\\5000\\sv_minPing\\0\\sv_privateClients\\0\\sv_punkbuster\\0\\sv_pure\\1\\sv_voice\\0\\ui_maxclients\\32\\pswrd\\0\\mod\\1\n", ["AF_INET", 28960, "192.168.32.59", "192.168.32.59"]]
        ) 
      )
      IO.stub(:select).and_return(true)
      @cod4s = CallOfDuty::Cod4Server.new('192.168.32.59')
      @cod4s.query_server
    end


    it "retrieves a response" do
      @cod4s.response.is_a?(Array).should eq true
      @cod4s.response.first.should =~ /^status/
    end

    %w(mapname players servername maxplayers currplayers).each do |n|
      it "sets #{n} accessor" do
        @cod4s.send(n).should_not be_nil
      end
    end

  end

end
