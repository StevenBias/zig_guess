const std = @import("std");

const stdout = std.io.getStdOut().writer();
const stdin = std.io.getStdIn().reader();

pub fn main() !void {
    const rand = std.crypto.random.uintLessThanBiased(u8, 101);

    while (true) {
        try stdout.print("\n{s} ", .{"Enter a number between 0 and 100:"});

        var input_number: [10]u8 = undefined;
        const in_num = try stdin.readUntilDelimiter(&input_number, '\n');
        const number = std.fmt.parseInt(u8, in_num, 10) catch 101;

        if (number > 100) {
            try stdout.print("\n{s}\n", .{"Wrong number, please retry."});
            continue;
        }

        if (rand < number) {
            try stdout.print("It is {s}!\n", .{"lower"});
        } else if (rand > number) {
            try stdout.print("It is {s}!\n", .{"higher"});
        } else {
            try stdout.print("\n{s}\n", .{"You win!"});
            break;
        }
    }
    try stdout.print("\nThe secret number is: {}!\n", .{rand});
}
