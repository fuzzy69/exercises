module leetcode.singlenumber;


class Solution
{
    static int singleNumber(int[] nums)
    {
        assert(nums.length > 0);
        int result = 0;
        // If there are duplicate/even numbers, second XOR will remove first number/bits. 
        // It'll give unique number if there are any or zero if there are none
        foreach (int i ; nums)
        {
            result ^= i;
        }

        return result;
    }
}

unittest
{
    assert(Solution.singleNumber([2, 2, 1]) == 1);
    assert(Solution.singleNumber([4, 1, 2, 1, 2]) == 4);
    assert(Solution.singleNumber([1]) == 1);
}
