require "connect_four"

describe Board do
  let(:game) {Board.new}

  describe "#make_move" do
    context "valid move" do
      it "correctly makes and displays a move" do
        game.make_move(0, "⚫")

        #game.print_board #commented out for clarity of output
      end

      it "correctly makes and displays three moves" do
        game.make_move(0, "⚫")
        game.make_move(0, "⚪")
        game.make_move(0, "⚫")

        #game.print_board #commented out for clarity of output
      end
    end

    context "invalid move" do
      it "returns an error message and prompts a new move" do
        #maybe done inside play???
      end
    end
  end

  describe "#print_board" do
    context "no moves made" do
      it "prints an empty board" do
        expect{ game.print_board }.to output("_ _ _ _ _ _ _\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _\n").to_stdout
      end
    end

    context "two moves made" do
      it "prints the board with the correct moves made" do
        game.make_move(0, "⚫")
        game.make_move(3, "⚪")
        expect{ game.print_board }.to output("_ _ _ _ _ _ _\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _\n_ _ _ _ _ _ _\n⚫ _ _ ⚪ _ _ _\n").to_stdout
      end
    end
  end

  describe "#draw_check" do
    context "while moves are less than 42; an empty stack exists" do
      it "returns false" do
        #random moves
        game.make_move(0, "⚫")
        game.make_move(3, "⚪")

        expect(game.draw_check).to be false
      end
    end

    context "when every stack is full" do
      it "returns true" do
        top_row = game.instance_variable_get(:@board)[0]
        top_row.each {|cell| cell.color = "X"} #simulating full stacks

        expect(game.draw_check).to be true
      end
    end
  end

  describe "#win_check" do
    context "if win condition is not fulfilled" do
      it "returns false" do
        #random moves
        game.make_move(0, "⚫")
        game.make_move(3, "⚪")

        expect(game.win_check).to be false
        #do a NOT TO BE here
      end
    end

    context "if win condition is fulfilled with" do
      context "horizontal win" do
        it "returns true" do
          game.make_move(0, "⚫")
          game.make_move(1, "⚫")
          game.make_move(2, "⚫")
          game.make_move(3, "⚫")

          expect(game.horizontal_win_check("⚫")).to be true
        end

        it "returns true" do
          game.make_move(3, "⚪")
          game.make_move(4, "⚪")
          game.make_move(5, "⚪")
          game.make_move(6, "⚪")

          expect(game.horizontal_win_check("⚪")).to be true
          #expect(game.horizontal_win_check("⚫")).not_toto be true
        end
      end

      context "vertical win" do
        it "returns true" do
          game.make_move(0, "⚫")
          game.make_move(0, "⚫")
          game.make_move(0, "⚫")
          game.make_move(0, "⚫")

          expect(game.vertical_win_check("⚫")).to be true
          #expect(game.vertical_win_check("⚪")).not_to be true
        end

        it "returns true" do
          game.make_move(1, "⚪")
          game.make_move(1, "⚪")
          game.make_move(1, "⚪")
          game.make_move(1, "⚪")

          expect(game.vertical_win_check("⚪")).to be true
        end
      end

      context "diagonal win" do
        it "returns true" do
          game.make_move(1, "⚪")
          game.make_move(2, "⚪")
          game.make_move(2, "⚪")
          game.make_move(3, "⚪")
          game.make_move(3, "⚪")
          game.make_move(3, "⚪")

          game.make_move(0, "⚫")
          game.make_move(1, "⚫")
          game.make_move(2, "⚫")
          game.make_move(3, "⚫")

          expect(game.diagonal_win_check("⚫")).to be true
        end
      end
    end
  end
end
