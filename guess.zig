const std = @import("std");

const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    try stdout.print("{s}\n", .{"Hello!"});
}
