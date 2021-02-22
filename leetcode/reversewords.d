module leetcode.reversewords;

import std.ascii : isAlphaNum, toLower;


class Solution
{
    static string reverseWords(string s)
    {
        char[] result = s.dup;
        ulong leftIndex = 0;
        ulong righIndex = s.length - 1;
        while (leftIndex < righIndex)
        {
            immutable(char) tmp = result[leftIndex];
            result[leftIndex] = result[righIndex];
            result[righIndex] = tmp;
            ++leftIndex;
            --righIndex;
        }

        int l = -1; // word start index
        int r = -1; // word end index
        for (int i = 0; i < s.length; ++i)
        {
            if (result[i] == ' ' || i == s.length - 1)
            {
                if (l == -1 && r == -1)  // word indices not set
                {
                    continue;
                }
                else if (r == -1) // one char word
                {
                    l = -1;
                    continue;
                }
                else
                {
                   if (i == s.length - 1) // if no spaces at end r index is left at i < r
                        r = i;
                    while (l < r)
                    {
                        immutable(char) tmp = result[l];
                        result[l] = result[r];
                        result[r] = tmp;
                        ++l;
                        --r;
                    }
                    l = -1;
                    r = -1;
                }
            }
            else if (l == -1 && r == -1)  // set word start index
            {
                l = i;
            }
            else  // set/update word end index
            {
                r = i;
            }
        }

        return result.idup;
    }
}

unittest
{
    import std.stdio : writeln;

    Solution solution;
    assert(solution.reverseWords("the sky is blue") == "blue is sky the");
    // assert(solution.reverseWords("  hello world  ") == "world hello");
    // assert(solution.reverseWords("a good   example") == "example good a");
    // assert(solution.reverseWords("  Bob    Loves  Alice   ") == "Alice Loves Bob");
    assert(solution.reverseWords("Alice does not even like bob") == "bob like even not does Alice");
}
