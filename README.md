# Tic Tac Toe

## Win Conditions

  * A player has a horizontal row containing only their letter
  * A player has a vertical row containing only their letter
  * A player has either diagonal containing only their letter

   In order to check for the diagonal win condition we perform two separate checks (one for each diagonal). In order to do this we iterate through the array of rows (the gameboard) and take the letter at the position of the row's index (so for example, we take the 0th element from the 0th row, the 1st element from the 1st row, etc.) for the main diagonal, and then reverse each row and do the same for the opposite diagonal. On each iteration we save the letter at the position we are checking into an array, and then check that the array only has one unique letter within it (thus a winning diagonal.)
