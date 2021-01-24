module selectionsort;

int[] selectionSort(int[] array)
{
    if (array.length < 2) // Skip empty or 1 element arrays
        return array;
    int[] sortedArray = array;
    for (ulong i = 0; i < sortedArray.length; ++i)
    {
        // Find minimum element index
        ulong minIndex = i;
        for (ulong j = i; j < sortedArray.length; ++j)
        {
            if (sortedArray[j] < sortedArray[minIndex])
                minIndex = j;
        }
        // Swap
        if (i != minIndex)  // Skip self swap
        {
            immutable item = sortedArray[i];
            sortedArray[i] = sortedArray[minIndex];
            sortedArray[minIndex] = item;
        }
    }

    return sortedArray;
}

unittest
{
    import std.stdio : writeln;
    import std.array : array;
    import std.random : uniform, Random;
    import std.range : generate, takeExactly;
    import std.algorithm : isSorted;

	int[] randomArray = generate!(() => uniform(0, 100)).takeExactly(10).array;
    auto sortedArray = selectionSort(randomArray.dup);
    writeln(randomArray);
    writeln(sortedArray);
    assert(sortedArray.isSorted);
}
