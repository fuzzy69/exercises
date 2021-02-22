module leetcode.twosum;


class Solution
{
    static int[2] twoSum(int[] nums, int target)
    {
        int[2] result;
        int[int] map;
        for (int i = 0; i < nums.length; i++)
        {
            int x = nums[i];
            int y = target - x;
            if (y in map)
            {
                result[0] = map[y];
                result[1] = i;
            }
            map[x] = i;
        }

        return result;
    }
}

unittest
{
    import std.stdio : writeln;
    import std.array : array;
    import std.random : uniform, Random;
    import std.range : generate, takeExactly;
    import std.algorithm : isSorted;

    Solution solution;
    assert(solution.twoSum([2, 7, 11, 15], 9) == [0, 1]);
    assert(solution.twoSum([3, 2, 4], 6) == [1, 2]);
    assert(solution.twoSum([3, 3], 6) == [0, 1]);
}
