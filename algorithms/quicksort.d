module quicksort;

int[] quickSort(int[] arr)
{
    // TODO: finish this

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
    auto sortedArray = quickSort(randomArray.dup);
    writeln(randomArray);
    writeln(sortedArray);
    assert(sortedArray.isSorted);
}
