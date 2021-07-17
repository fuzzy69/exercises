module leetcode.rotateimage;

import std.algorithm : max;
import std.algorithm.mutation : swap;


class Solution
{
    static void rotateImage(int[][] matrix)
    {
        immutable ulong n = matrix.length;

        // Flip matrix diagonally NE -> SW
        for (ulong i = 0; i < n; ++i)
        {
            for (ulong j = i; j < n; ++j)
            {
                swap(matrix[i][j], matrix[j][i]);
            }
        }
        // Flip matrix horizontally
        for (ulong i = 0; i < n; ++i)
        {
            for (ulong j = 0; j < n / 2; ++j)
            {
                swap(matrix[i][j], matrix[i][n - 1 - j]);
            }
        }
    }
}

unittest
{
    import std.algorithm : equal;

    bool arraysEqual(int[][] a, int[][] b)
    {
        if (a.length != b.length)
            return false;
        for (ulong i = 0; i < a.length; ++i)
        {
            if (a[i].length != b[i].length)
                return false;
            for (ulong j = 0; j < a[i].length; ++j)
            {
                if (a[i][j] != b[i][j])
                    return false;
            }
        }

        return true;
    }
    int[][] matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
    int[][] result = [[7, 4, 1], [8, 5, 2], [9, 6, 3]];
    Solution.rotateImage(matrix);
    assert(arraysEqual(matrix,  result));
    matrix = [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]];
    result = [[15, 13, 2, 5], [14, 3, 4, 1], [12, 6, 8, 9], [16, 7, 10, 11]];
    Solution.rotateImage(matrix);
    assert(arraysEqual(matrix, result));
    matrix = [[1]];
    result = [[1]];
    Solution.rotateImage(matrix);
    assert(arraysEqual(matrix, result));
    matrix = [[1, 2], [3, 4]];
    result = [[3, 1], [4, 2]];
    Solution.rotateImage(matrix);
    assert(arraysEqual(matrix, result));
}
