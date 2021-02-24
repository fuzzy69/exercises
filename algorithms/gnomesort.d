module algorithms.gnomesort;

import std.algorithm.mutation : swap;


int[] gnomeSort(int[] arr)
{
    if (arr.length < 2)
        return arr;
    ulong i = 0;
    while (i < arr.length)
    {
        if (i == 0)
            ++i;
        if (arr[i - 1] <= arr[i])
        {
            ++i;
        }
        else
        {
            swap(arr[i - 1], arr[i]);
            --i;
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
    auto sortedArray = gnomeSort(randomArray.dup);
    writeln(randomArray);
    writeln(sortedArray);
    assert(sortedArray.isSorted);
}
