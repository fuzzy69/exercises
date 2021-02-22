module heapsort;


void heapify(int[] arr, int n, int rootIndex)
{
    int largestNodeIndex = rootIndex;
    immutable(int) leftNodeIndex = 2 * rootIndex + 1;
    immutable(int) rightNodeIndex = 2 * rootIndex + 2;

    if (leftNodeIndex < n && arr[leftNodeIndex] > arr[largestNodeIndex])
        largestNodeIndex = leftNodeIndex;
    if (rightNodeIndex < n && arr[rightNodeIndex] > arr[largestNodeIndex])
        largestNodeIndex = rightNodeIndex;
    if (largestNodeIndex != rootIndex)
    {
        // Swap
        immutable(int) tmp = arr[rootIndex];
        arr[rootIndex] = arr[largestNodeIndex];
        arr[largestNodeIndex] = tmp;
        heapify(arr, n, largestNodeIndex);
    }
}

int[] heapSort(int[] arr, int arrayLength)
{
    for (int i = arrayLength / 2 - 1; i >= 0; i--)
        heapify(arr, arrayLength, i);

    for (int i = arrayLength - 1; i > 0; i--)
    {
        // Swap
        immutable(int) tmp = arr[0];
        arr[0] = arr[i];
        arr[i] = tmp;
        heapify(arr, i, 0);
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

    const int arrayLength = 10;
	int[] randomArray = generate!(() => uniform(0, 100)).takeExactly(arrayLength).array;
    auto sortedArray = heapSort(randomArray.dup, arrayLength);
    writeln(randomArray);
    writeln(sortedArray);
    assert(sortedArray.isSorted);
}