# Trees_tent_solution_ASP

# README

## Running the Solver

### Requirements
- Python 3.x
- Clingo (version X.X.X or later)

### Usage
1. Ensure you have Python and Clingo installed on your system.
2. Prepare an input file containing the puzzle description. This file should follow a specific format.

   
   ##Input format
Please use the following file format for puzzles:



![Screenshot 2024-02-29 164405](https://github.com/GTGaganReddy/Trees_tent_solution_ASP/assets/74946644/33e7a2bb-2e72-4149-bd69-a1eae5ee7635)

The first line provides the dimensions of the puzzle (rows columns). Then one line per row representing the puzzle, a dot for an empty cell or a T for a tree, after the line, separated by a space, follows the number of tents in the row. After the last line of the puzzle follow the numbers of tents for each column (separated by spaces).


3. Run the Python script (python "filename.py") to generate the ASP rules and append them to your existing constraints file (input_to_rules.lp).
4. Use Clingo to process the ASP file and find solutions.
    clingo input_to_riles.lp

