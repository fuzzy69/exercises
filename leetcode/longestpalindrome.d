module leetcode.longestpalindrome;

/*
https://leetcode.com/problems/longest-palindromic-substring/

5. Longest Palindromic Substring

Given a string s, return the longest palindromic substring in s.

Example 1:

Input: s = "babad"
Output: "bab"
Note: "aba" is also a valid answer.
Example 2:

Input: s = "cbbd"
Output: "bb"
Example 3:

Input: s = "a"
Output: "a"
Example 4:

Input: s = "ac"
Output: "a"
 

Constraints:

1 <= s.length <= 1000
s consist of only digits and English letters (lower-case and/or upper-case),
*/

import std.algorithm : max;
import std.stdio : writeln;


class Solution
{
public:
    static string longestPalindrome(string s)
    {
        assert (1 <= s.length && s.length <= 1000);
        string result = "";
        for (int i = 0; i < s.length; ++i)
        {
            // Check odd length substring
            string oddSubstring = expandString(s, i, i);
            // Check even length substring
            string evenSubstring = expandString(s, i, i + 1);
            // Pick longest substring
            result = longestString(result, oddSubstring, evenSubstring);
        }

        return result;
    }

private:
    static string expandString(string s, int leftIndex, int rightIndex)
    {
        // Move left and right indexes as long as their characters are equal and thus making palindrome
        while (leftIndex >= 0 && rightIndex < s.length && s[leftIndex] == s[rightIndex])
        {
            --leftIndex;
            ++rightIndex;
        }

        // Loop increases/decreases indexes on last iteration so we should ignore leftmost and rightmost characters because they're not palindromic
        return s[leftIndex + 1 .. rightIndex];
    }

    static string longestString(string a, string b, string c)
    {
        if (a.length >= b.length && a.length >= c.length)
            return a;
        else if (b.length >= c.length)
            return b;
        else
            return c;
    }
}

unittest
{
    assert(Solution.longestPalindrome("babad") == "bab");
    assert(Solution.longestPalindrome("cbbd") == "bb");
    assert(Solution.longestPalindrome("ac") == "a");
    assert(Solution.longestPalindrome("a") == "a");
}
