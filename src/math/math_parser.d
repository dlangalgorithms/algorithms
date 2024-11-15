import std;

/**
 * The Parser class is responsible for parsing and evaluating mathematical expressions.
 */
class Parser {
    private string input; // The input string containing the expression to parse.
    private int pos;      // The current position in the input string.

    /**
     * Constructs a Parser with the given input string.
     *
     * @param input The string representation of the mathematical expression.
     */
    this(string input) {
        this.input = input;
        this.pos = 0; // Initialize position to the start of the input.
    }

    /**
     * Peeks at the next character in the input without consuming it.
     *
     * @return The next character or '0' if the end of the input is reached.
     */
    private char peek() {
        if (pos < input.length) {
            return input[pos]; // Return the current character at position pos.
        }
        return '0'; // Return '0' if we are at the end of the input.
    }

    /**
     * Consumes and returns the next character in the input.
     *
     * @return The next character or '0' if the end of the input is reached.
     */
    private char next() {
        if (pos < input.length) {
            return input[pos++]; // Return the current character and increment position.
        }
        return '0'; // Return '0' if we are at the end of the input.
    }

    /**
     * Skips whitespace characters in the input.
     */
    private void skipWhitespace() {
        // Continue skipping while there are characters left and they are whitespace.
        while (pos < input.length && (peek == ' ' || peek == 't')) {
            next(); // Consume whitespace characters.
        }
    }

    /**
     * Parses an expression, which may consist of terms combined by '+' or '-'.
     *
     * @return The result of evaluating the expression as a double.
     */
    double parseExpr() {
        double result = parseTerm(); // Start with the first term.
        while (true) {
            skipWhitespace(); // Skip any whitespace before the operator.
            char op = peek(); // Peek at the next character (operator).
            if (op == '+' || op == '-') { // Check for addition or subtraction.
                next(); // Consume the operator.
                double rhs = parseTerm(); // Parse the right-hand side term.
                if (op == '+') {
                    result += rhs; // Add to result if operator is '+'.
                } else {
                    result -= rhs; // Subtract from result if operator is '-'.
                }
            } else {
                break; // Exit loop if no more '+' or '-' operators are found.
            }
        }
        return result; // Return the final evaluated result.
    }

    /**
     * Parses a term, which may consist of factors combined by '*' or '/'.
     *
     * @return The result of evaluating the term as a double.
     */
    double parseTerm() {
        double result = parseFactor(); // Start with the first factor.
        while (true) {
            skipWhitespace(); // Skip any whitespace before the operator.
            char op = peek(); // Peek at the next character (operator).
            if (op == '*' || op == '/') { // Check for multiplication or division.
                next(); // Consume the operator.
                double rhs = parseFactor(); // Parse the right-hand side factor.
                if (op == '*') {
                    result *= rhs; // Multiply result if operator is '*'.
                } else {
                    result /= rhs; // Divide result if operator is '/'.
                }
            } else {
                break; // Exit loop if no more '*' or '/' operators are found.
            }
        }
        return result; // Return the final evaluated term result.
    }

    /**
     * Parses a factor, which may be a number or a nested expression in parentheses.
     *
     * @return The result of evaluating the factor as a double.
     */
    double parseFactor() {
        skipWhitespace(); // Skip any whitespace before processing factor.
        if (peek() == '(') { // Check for opening parenthesis indicating a nested expression.
            next(); // Consume the '(' character.
            double result = parseExpr(); // Parse the nested expression.
            next(); // Consume the closing ')' character.
            return result; // Return the evaluated result of the nested expression.
        } else {
            return parseNumber(); // Otherwise, parse a number directly.
        }
    }

    /**
     * Parses a number from the input string.
     *
     * @return The parsed number as a double.
     */
    double parseNumber() {
        skipWhitespace(); // Skip any whitespace before processing number.
        size_t start = pos; // Mark the start position of the number.
        while (pos < input.length && (isDigit(peek()) || peek == '.')) {
            next(); // Consume digits or decimal point to form a number.
        }
        return to!double(input[start..pos]); // Convert and return the substring as a double.
    }
}

/* TESTS */
double testExpr(string expr){
    Parser parser = new Parser(expr);
    return parser.parseExpr();
}

unittest{

    assert(testExpr("2+4") == 6);
    assert(testExpr("3 + (67 - 17)") == 53);
    assert(testExpr("2 * 3 * 4 + (2 * 4)") == 32);
}

/*Program tests are performed above in the unittest block*/
int main() {
    return 0;
}
