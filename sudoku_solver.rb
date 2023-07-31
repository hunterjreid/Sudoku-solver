def solve_sudoku(board)
  empty_cell = find_empty_cell(board)
  return true unless empty_cell

  row, col = empty_cell

  1.upto(9) do |num|
    if valid_move?(board, row, col, num)
      board[row][col] = num
      if solve_sudoku(board)
        return true
      else
        board[row][col] = 0
      end
    end
  end

  return false
end

def find_empty_cell(board)
  9.times do |row|
    9.times do |col|
      return [row, col] if board[row][col] == 0
    end
  end
  return nil
end

def valid_move?(board, row, col, num)
  return !row_contains?(board, row, num) &&
         !col_contains?(board, col, num) &&
         !box_contains?(board, row - row % 3, col - col % 3, num)
end

def row_contains?(board, row, num)
  board[row].include?(num)
end

def col_contains?(board, col, num)
  board.transpose[col].include?(num)
end

def box_contains?(board, start_row, start_col, num)
  3.times do |row|
    3.times do |col|
      return true if board[start_row + row][start_col + col] == num
    end
  end
  return false
end

# Change your board here:
board = [
  [5, 3, 0, 0, 7, 0, 0, 0, 0],
  [6, 0, 0, 1, 9, 5, 0, 0, 0],
  [0, 9, 8, 0, 0, 0, 0, 6, 0],
  [8, 0, 0, 0, 6, 0, 0, 0, 3],
  [4, 0, 0, 8, 0, 3, 0, 0, 1],
  [7, 0, 0, 0, 2, 0, 0, 0, 6],
  [0, 6, 0, 0, 0, 0, 2, 8, 0],
  [0, 0, 0, 4, 1, 9, 0, 0, 5],
  [0, 0, 0, 0, 8, 0, 0, 7, 9]
]

if solve_sudoku(board)
  puts "Sudoku solved!"
  board.each { |row| puts row.join(" ") }
else
  puts "No solution found."
end
