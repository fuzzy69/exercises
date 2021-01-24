module insertionsort;

int[] insertionSort(int[] arr)
{
    if (arr.length < 2)
        return arr;
    for (ulong i = 1; i < arr.length; ++i)
    {
        ulong j = i;
        while (j > 0 && arr[j - 1] > arr[j])
        {
            int item = arr[j];
            arr[j] = arr[j - 1];
            arr[j - 1] = item;
            --j;
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
    auto sortedArray = insertionSort(randomArray.dup);
    writeln(randomArray);
    writeln(sortedArray);
    assert(sortedArray.isSorted);
}
