module bubblesort;

int[] bubbleSort(int[] array)
{
    if (array.length < 2)
        return array;
    int[] sortedArray = array;
    bool swapped;
    for (ulong i = array.length; i > 0; --i)
    {
        swapped = false;
        for (ulong j = 0; j < i - 1; ++j)
        {
            if (sortedArray[j] > sortedArray[j + 1])
            {
                immutable item = sortedArray[j];
                sortedArray[j] = sortedArray[j + 1];
                sortedArray[j + 1] = item;
                swapped = true;
            }
        }
        if (!swapped)
            break;
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
    auto sortedArray = bubbleSort(randomArray.dup);
    writeln(randomArray);
    writeln(sortedArray);
    assert(sortedArray.isSorted);
}
