module leetcode.rotatearray;

import std.ascii : isAlphaNum, toLower;


class Solution
{
    static void rotateArray(int[] arr, ulong k)
    {
        k = k % arr.length; // If k is greater than array length
        ulong splitIndex = arr.length - k; // 

        reverseArray(arr[0 .. splitIndex]); // reverse first part
        reverseArray(arr[splitIndex .. $]); // reverse second part
        reverseArray(arr); // reverse whole array in order to get result
    }

    static void reverseArray(int[] arr)
    {
        if (arr.length > 1)
        {
            ulong leftIndex = 0;
            ulong rightIndex = arr.length - 1;
            while (leftIndex < rightIndex)
            {
                int tmp = arr[leftIndex];
                arr[leftIndex] = arr[rightIndex];
                arr[rightIndex] = tmp;
                ++leftIndex;
                --rightIndex;
            }
        }
    }
}

unittest
{
    import std.algorithm : equal;
    import std.stdio : writeln;

    Solution solution;
    int[] arr = [1, 2, 3, 4, 5, 6];
    writeln("Starting array: ", arr);
    solution.rotateArray(arr, 2);
    assert(equal(arr, [5, 6, 1, 2, 3, 4]));
    writeln("Shifted right by 2 places: ", arr);
    solution.rotateArray(arr, 4);
    assert(equal(arr, [1, 2, 3, 4, 5, 6]));
    writeln("Shifted right by another 4 places: ", arr);
    solution.rotateArray(arr, 8);
    writeln("Shifted right by another 8 places: ", arr);
    assert(equal(arr, [5, 6, 1, 2, 3, 4]));
}
