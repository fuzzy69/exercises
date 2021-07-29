module leetcode.reverseinteger;

/*
https://leetcode.com/problems/reverse-integer/

7. Reverse Integer
Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

Example 1:

Input: x = 123
Output: 321
Example 2:

Input: x = -123
Output: -321
Example 3:

Input: x = 120
Output: 21
Example 4:

Input: x = 0
Output: 0

Constraints:

-2^31 <= x <= 2^31 - 1
*/

import std.stdio : writeln;

class Solution
{
    static int reverseInteger(int x)
    {
        int result = 0;
        while (x != 0)
        {
            // Give up on underflow/overflow
            if (result > int.max / 10)
                return 0;
            result = result * 10 + x % 10;
            x /= 10;
        }

        return result;
    }
}

unittest
{
    assert(Solution.reverseInteger(123) == 321);
    assert(Solution.reverseInteger(-123) == -321);
    assert(Solution.reverseInteger(120) == 21);
    assert(Solution.reverseInteger(0) == 0);
}
