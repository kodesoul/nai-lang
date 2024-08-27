// --- main ---

pub fn main() !void {
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("Hello {s}\n", .{"Rafiki"});
    try bw.flush();
}

// --- imports ---

const std = @import("std");
const lib = @import("root.zig");
