module leetcode.removeelement;

import std.algorithm : max;


class Solution
{
    static int removeElement(int[] nums, int val)
    {
        int index = 0;
        for (int i = 0; i < nums.length; ++i)
        {
            if (nums[i] != val)
            {
                nums[index] = nums[i]; // Copy current element to new or same position and skip target elements
                ++index;
            }
        }
        for (int i = index; i < nums.length; ++i) // Mark unused unused elements
            nums[i] = -1;

        return index;
    }
}

unittest
{
    import std.algorithm : equal;

    Solution solution;
    int[] nums = [3, 2, 2, 3];
    int val = 3;
    int[] result = [2, 2, -1, -1];
    int numsLength = solution.removeElement(nums, val);
    assert(numsLength == 2);
    assert(equal(nums, result));
    nums = [0, 1, 2, 2, 3, 0, 4, 2];
    val = 2;
    result = [0, 1, 3, 0, 4, -1, -1, -1];
    numsLength = solution.removeElement(nums, val);
    assert(numsLength == 5);
    assert(equal(nums, result));
}
