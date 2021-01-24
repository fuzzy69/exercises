module mergesort;

int[] mergeSort(int[] arr)
{
    import std.stdio : writeln;
    if (arr.length < 2)
        return arr;
    ulong midIndex = arr.length / 2;
    int[] leftArray = mergeSort(arr[0 .. midIndex].dup);
    int[] rightArray = mergeSort(arr[midIndex .. $].dup);
    ulong i = 0, j = 0, k = 0;
    while (i < leftArray.length && j < rightArray.length)
    {
        if (leftArray[i] < rightArray[j])
        {
            arr[k] = leftArray[i];
            ++i;
        }
        else
        {
            arr[k] = rightArray[j];
            ++j;
        }
        ++k;
    }

    while (i < leftArray.length)
    {
        arr[k] = leftArray[i];
        ++i;
        ++k;
    }
    while (j < rightArray.length)
    {
        arr[k] = rightArray[j];
        ++j;
        ++k;
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
    auto sortedArray = mergeSort(randomArray.dup);
    writeln(randomArray);
    writeln(sortedArray);
    assert(sortedArray.isSorted);
}