require "connect_four"

describe Board do
  let(:game) {Board.new}

  describe "#make move" do
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


end
