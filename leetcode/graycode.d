module leetcode.graycode;


class Solution
{
    static int[] grayCode(uint n)
    {
        assert(1 <= n && n <= 16);
        int[] result;
        for(int i = 0; i < (1 << n); ++i)
        {
            result ~= i ^ (i >> 1);
        }

        return result;
    }
}

unittest
{
    import std.algorithm : equal;

    assert(equal(Solution.grayCode(2), [0, 1, 3, 2]));
    assert(equal(Solution.grayCode(3), [0, 1, 3, 2, 6, 7, 5, 4]));
}
