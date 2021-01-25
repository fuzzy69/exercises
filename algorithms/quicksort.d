module quicksort;

import std.algorithm.mutation : swap;

///
int partition(int[] arr, int leftIndex, int rightIndex)
{
    int i = leftIndex - 1;
    const int pivot = arr[rightIndex];
    for (int j = leftIndex; j < rightIndex; j++)
    {
        if (arr[j] < pivot)
        {
            i++;
            swap(arr[i], arr[j]);
        }
    }
    swap(arr[i + 1], arr[rightIndex]);

    return i + 1;
}

///
void quickSort(int[] arr, int leftIndex, int rightIndex)
{
    int pivotIndex = 0;
    if (leftIndex < rightIndex)
    {
        pivotIndex = partition(arr, leftIndex, rightIndex);
        quickSort(arr, leftIndex, pivotIndex - 1);
        quickSort(arr, pivotIndex + 1, rightIndex);
    }
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
    writeln(randomArray);
    quickSort(randomArray, 0, arrayLength - 1);
    writeln(randomArray);
    assert(randomArray.isSorted);
}
