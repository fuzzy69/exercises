module leetcode.longestconsecutivesequence;

import std.algorithm : max;


class Solution
{
    static int longestConsecutiveSequence(int[] numbers)
    {
        bool[int] checkedNumbers; // Use this to check numbers only once
        foreach (int number; numbers)
            checkedNumbers[number] = false;
        int longest = 0;
        foreach (int number; numbers)
        {
            if (checkedNumbers[number])
                continue;
            // Mark first number in sequence
            int length = 1;
            checkedNumbers[number] = true;
            // Check numbers in sequence on right side
            for (int j = number + 1; j in checkedNumbers; ++j)
            {
                checkedNumbers[j]= true;
                ++length;
            }
            // Check numbers in sequence on left side
            for (int j = number - 1; j in checkedNumbers; --j)
            {
                checkedNumbers[j]= true;
                ++length;
            }
            longest = max(longest, length); // Pick new sequence length if it's greater than previous
        }

        return longest;
    }
}

unittest
{
    import std.algorithm : equal;
    import std.stdio : writeln, writefln;

    Solution solution;
    int[] arr1 = [100, 4, 200, 1, 3, 2];
    immutable int sequenceLength1 = 4;
    writefln("Sequence length for %s is %s", arr1, sequenceLength1);
    assert(solution.longestConsecutiveSequence(arr1) == sequenceLength1);
    int[] arr2 = [100, 4, 98, 200, 96, 1, 3, 2, 97, 99];
    immutable int sequenceLength2 = 5;
    writefln("Sequence length for %s is %s", arr2, sequenceLength2);
    assert(solution.longestConsecutiveSequence(arr2) == sequenceLength2);
    int[] arr3 = [100, 4, 98, 200, 96, 1];
    immutable int sequenceLength3 = 1;
    writefln("Sequence length for %s is %s", arr3, sequenceLength3);
    assert(solution.longestConsecutiveSequence(arr3) == sequenceLength3);
}
