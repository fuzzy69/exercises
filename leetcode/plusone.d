module leetcode.plusone;

import std.algorithm : reverse;


class Solution
{
    static int[] plusOne(int[] digits)
    {
        assert(1 <= digits.length && digits.length <= 100);
        int[] result;
        int carry = 1;
        for (ulong i = digits.length; i > 0; --i)
        {
            carry += digits[i - 1];
            result ~= carry % 10;
            carry /= 10;
            if (i == 1 && carry > 0)
                result ~= carry;
        }

        return result.reverse;
    }
}

unittest
{
    import std.algorithm : equal;

    assert(equal(Solution.plusOne([1, 2, 3]), [1, 2, 4]));
    assert(equal(Solution.plusOne([4, 3, 2, 1]), [4, 3, 2, 2]));
    assert(equal(Solution.plusOne([8, 9, 9]), [9, 0, 0]));
    assert(equal(Solution.plusOne([9, 9, 9]), [1, 0, 0, 0]));
}
