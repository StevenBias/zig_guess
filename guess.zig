const std = @import("std");

const stdout = std.io.getStdOut().writer();
const stdin = std.io.getStdIn().reader();

pub fn main() !void {
    const rand = std.crypto.random.uintLessThanBiased(u8, 100);
    try stdout.print("{s} ", .{"Enter a number:"});

    var input_number: [10]u8 = undefined;
    const in_num = try stdin.readUntilDelimiter(&input_number, '\n');
    const number: u8 = std.fmt.parseInt(u8, in_num, 10) catch 0;

    try stdout.print("\nYour number is: {}!\n", .{number});
    try stdout.print("My number is: {}!\n", .{rand});
}
