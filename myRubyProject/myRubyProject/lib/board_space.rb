class BoardSpace
    attr_reader :player
    
    def initialize
      @player = nil
    end
    
    def occupied?
      !@player.nil?
    end
  
    def set_player(new_player)
      occupied? ? false : @player = new_player
    end
  
    def get_symbol
      occupied? ? player.symbol : " "
    end
  
  end
  