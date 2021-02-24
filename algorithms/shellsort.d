module algorithms.shellsort;

import std.algorithm.mutation : swap;


int[] shellSort(int[] arr)
{
    if (arr.length < 2)
        return arr;
    for (ulong gap = arr.length / 2; gap > 0; gap /= 2)
    {
        for (ulong i = gap; i < arr.length; ++i)
        {
            immutable(int) tmp = arr[i];
            ulong j;
            for (j = i; j >= gap && arr[j - gap] > tmp; j -= gap)
                arr[j] = arr[j - gap];
            arr[j] = tmp;
        }
    }

    return arr;
}

unittest
{
    import std.stdio : writeln;
    import std.array : array;
    import std.random : uniform, Random;
    import std.range : generate, takeExactly;
    import std.algorithm : isSorted;

	int[] randomArray = generate!(() => uniform(0, 100)).takeExactly(10).array;
    auto sortedArray = shellSort(randomArray.dup);
    writeln(randomArray);
    writeln(sortedArray);
    assert(sortedArray.isSorted);
}
