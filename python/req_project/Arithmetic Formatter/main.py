def arithmetic_arranger(problems, show_answers=False):
    # Too many problems. || more than 5 problems
    if len(problems) > 5:
        return 'Error: Too many problems.'
    
    # Lists to store formatted rows
    first_row = []
    second_row = []
    line_row = []
    answer_row = []

    # Process each problem
    for problem in problems:
        try:
            first, arithmetic, last = problem.split(" ")
        except ValueError:
            return "Error: Invalid problem format."
        
        # Numbers must only contain digits.'
        if not(first.isdigit() and last.isdigit()):
            return 'Error: Numbers must only contain digits.'
        
        # Numbers cannot be more than four digits.
        if len(first) > 4 or len(last) > 4:
            return 'Error: Numbers cannot be more than four digits.'
        
        # Operator must be '+' or '-'."
        if arithmetic not in ['+', '-']:
            return "Error: Operator must be '+' or '-'."
        
        # Determine width based on the longest number
        width = max(len(first), len(last)) + 2

        # Format each row
        first_row.append(first.rjust(width))
        second_row.append(arithmetic + " " +last.rjust(width - 2))
        line_row.append('-'*width)
        
        # Compute and align result if show_answers is True
        if show_answers:
            result = str(eval(first + arithmetic + last)).rjust(width)
            answer_row.append(result)
    
    # Join the rows with proper spacing (4 spaces between columns)
    arranged_problems = "\n".join([
        "    ".join(first_row),
        "    ".join(second_row),
        "    ".join(line_row),
    ])

    # Append answers if required
    if show_answers:
        arranged_problems += "\n" + "    ".join(answer_row)

    return arranged_problems
print(f'\n{arithmetic_arranger(["3801 - 2", "123 + 49"], True)}')
arithmetic_arranger(["3801 - 2", "123 + 49", "sad asd ads"])
arithmetic_arranger(["3801 - 2", "123 + 49"])
arithmetic_arranger(["1 + 2", "1 - 9380"])
arithmetic_arranger(["3 + 855", "3801 - 2", "45 + 43", "123 + 49"])
arithmetic_arranger(["11 + 4", "3801 - 2999", "1 + 2", "123 + 49", "1 - 9380"])
arithmetic_arranger(["44 + 815", "909 - 2", "45 + 43", "123 + 49", "888 + 40", "653 + 87"])
arithmetic_arranger(["3 / 855", "3801 - 2", "45 + 43", "123 + 49"])
arithmetic_arranger(["24 + 85215", "3801 - 2", "45 + 43", "123 + 49"])
arithmetic_arranger(["98 + 3g5", "3801 - 2", "45 + 43", "123 + 49"])
arithmetic_arranger(["3 + 855", "988 + 40"], True)
arithmetic_arranger(["32 - 698", "1 - 3801", "45 + 43", "123 + 49", "988 + 40"], True)
