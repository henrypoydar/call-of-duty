require 'spec_helper'

describe CallOfDuty::Cod4Server do

  describe "#query_server" do

    before do
      @cod4s = CallOfDuty::Cod4Server.new('192.168.32.59')
      @cod4s.query_server
    end

    it "retrieves a response" do
      @cod4s.response.should eq "hey" 
    end

    %w(mapname players servername maxplayers currplayers).each do |n|
      it "sets #{n} accessor" do
         
      end
    end

  end

end
