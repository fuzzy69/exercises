module leetcode.validpalindrome;

import std.ascii : isAlphaNum, toLower;


class Solution
{
    static bool isPalindrome(string s)
    {
        ulong leftIndex = 0;
        ulong rightIndex = s.length - 1;
        while (leftIndex < rightIndex)
        {
            while (leftIndex < rightIndex && !s[leftIndex].isAlphaNum)
                ++leftIndex;
            while (leftIndex < rightIndex && !s[rightIndex].isAlphaNum)
                --rightIndex;
            if (s[leftIndex].toLower != s[rightIndex].toLower)
                return false;
            ++leftIndex;
            --rightIndex;
        }

        return true;
    }
}

unittest
{
    import std.stdio : writeln;

    Solution solution;
    assert(solution.isPalindrome("A man, a plan, a canal: Panama") is true);
    assert(solution.isPalindrome("race a car") is false);
}
