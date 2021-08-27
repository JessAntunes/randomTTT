class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :board, default: [
        ['','','','','','','','',''],
        ['','','','','','','','',''],
        ['','','','','','','','',''],
        ['','','','','','','','',''],
        ['','','','','','','','',''],
        ['','','','','','','','',''],
        ['','','','','','','','',''],
        ['','','','','','','','',''],
        ['','','','','','','','',''],
      ], array: true
      t.string :winner
      t.string :turn, default: "X"
      t.string :valid_subgames, default: [0,1,2,3,4,5,6,7,8], array: true

      t.timestamps
    end
  end
end
