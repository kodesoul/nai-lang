// --- tokenizer ---

const Tokenizer = struct {
    const Self = @This();

    src: []const u8,
    done: bool = false,
    start: usize = 0,
    current: usize = 0,

    pub fn next(self: *Self) ?Token {
        if (self.done) return null;

        if (self.peek()) |ch| {
            self.advance();

            return switch (ch) {
                '(' => self.makeToken(.tk_paren_left),
                ')' => self.makeToken(.tk_paren_right),
                '{' => self.makeToken(.tk_brace_left),
                '}' => self.makeToken(.tk_brace_right),
                ';' => self.makeToken(.tk_semicolon),
                '+' => self.makeToken(.tk_plus),
                '-' => self.makeToken(.tk_minus),
                '*' => self.makeToken(.tk_star),
                '/' => self.makeToken(.tk_slash),
                '=' => self.makeAssign(),
                '"' => self.makeString(),
            };
        }

        self.done = true;
        return self.makeToken(.tk_eos);
    }

    fn makeString(self: *Self) Token {
        while (self.peek() != '"') self.advance();
        self.advance();
        return self.makeToken(.tk_string);
    }

    fn makeAssign(self: *Self) Token {
        if (self.peek() == '=') {
            self.advance();
            return self.makeToken(.tk_equals);
        }

        return self.makeToken(.tk_assign);
    }

    fn makeToken(self: *Self, kind: Token.Kind) Token {
        return .{
            .kind = kind,
            .slice = self.src[self.start..self.current],
        };
    }

    fn peek(self: *Self) ?u8 {
        if (self.current >= self.src.len) return null;
        return self.src[self.current];
    }

    fn advance(self: *Self) void {
        self.current += 1;
    }
};

const Token = struct {
    kind: Kind,
    slice: []const u8,

    const Kind = enum(u8) {
        // Keywords
        tk_return,
        tk_fn,
        tk_mut,
        tk_let,
        tk_void,
        tk_print,
        tk_if,
        tk_else,
        tk_for,
        tk_s64,

        tk_colon,
        tk_semicolon,
        tk_ident,
        tk_string,
        tk_number,
        tk_comment,

        // Math
        tk_plus,
        tk_minus,
        tk_star,
        tk_slash,

        // Assignment
        tk_assign,
        tk_assign_plus,

        // Braces
        tk_paren_left,
        tk_paren_right,
        tk_brace_left,
        tk_brace_right,

        // Comparison
        tk_equals,
        tk_greater,
        tk_greater_equals,
        tk_less,
        tk_less_equals,

        // End of Stream
        tk_eos,
    };
};

// --- imports ---

const std = @import("std");
const tst = std.testing;
