class Game < ApplicationRecord

    WIN_COMBINATIONS = [0,1,2], 
                        [3,4,5],
                        [6,7,8],
                        [0,3,6],
                        [1,4,7],
                        [2,5,8],
                        [0,4,8],
                        [6,4,2]
    
        
    # x goes in any sub array 
    def move(cell, subgame)
        if @turn = "X"
            @board[subgame][cell] = "X"
            @turn = "O"
        else
            @board[subgame][cell] = "O"
            @turn = "X"   
        end
    end

    #    for move: check if space is available
    def spot_taken?(cell, subgame)
        return false if @board[subgame][cell] == " "
        return true
    end

    #     check if subgame is in subgame array
    def in_subgame_array?(subgame)
        return true if @valid_subgames[subgame] = subgame
        return false
    end

    def set_next_valid_subgame(cell)
        if !subgame_full?(cell)
            @valid_subgames = [cell]
        else
            @valid_subgames = [0, 1, 2, 3, 4, 5, 6, 7, 8]
            @board.each do |subgame|
                if subgame_full?(subgame)
                    remove_subgame(subgame)
                end
            end
        end
    end

    # once subarray is full remove from sub array
    def remove_subgame(subgame)
        @valid_subgames.delete_at(subgame) #add more logic ... doesnt work yet
    end

    # after each move change turn token and check for win or full subarray.
    def subgame_full?(subgame)
        @board[subgame].all? { |space| space != " "}
    end

    def subgame_draw?(subgame)
        subgame_full?(subgame) && !won?(subgame)
    end

    def subgame_won?(subgame)
        WIN_COMBINATIONS.find do |combination| 
             combination.all? {|cell| @board[subgame][cell] == "X" } || 
             combination.all? {|cell| @board[subgame][cell] == "O"}       
         end
    end

    #  valid move 
    # first check subgame is in array, check if cell is available
    def valid_move?(cell, subgame)
        !spot_taken?(cell, subgame) && in_subgame_array?(subgame)
    end


    # TURN
    def turn(cell, subgame)
       if valid_move?(cell, subgame)# check if valid move 
            move(cell, subgame) #make move and change token
            set_next_valid_subgame(cell) #set valid subgames based on move
       else
            #  error control
       end
       #check if whole board/game is full, won, or a draw
       



    end

    # end of move check if subgame is full
    # account for subgames all being unavailable i.e. valid_subgames.length = 0
    # check for winner on full board based of winners in subgame 
    # create algorithm that goes through each subgame checking for winner or draw and puts value in array
    #      see if result is equal to WIN_COMBINATIONS
end
