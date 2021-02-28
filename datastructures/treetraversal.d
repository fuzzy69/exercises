module datastructures.treetraversal;

import std.stdio : writeln;

import datastructures.node : Node;


void preOrder(T)(Node!T *node, ref T[] result)
{
    if (node == null)
        return;
    result ~= node.value;
    preOrder(node.left, result);
    preOrder(node.right, result);    
}

void inOrder(T)(Node!T *node, ref T[] result)
{
    if (node == null)
        return;
    inOrder(node.left, result);
    result ~= node.value;
    inOrder(node.right, result);
}

void postOrder(T)(Node!T *node, ref T[] result)
{
    if (node == null)
        return;
    postOrder(node.left, result);
    postOrder(node.right, result);
    result ~= node.value;
}

unittest
{
    import std.stdio : writeln;
    import std.array : array;
    import std.random : uniform, Random;
    import std.range : generate, takeExactly;
    import std.algorithm : isSorted;

    Node!int node1 = {5, null, null};
    Node!int node2 = {18, null, null};
    Node!int node3 = {1, null, null};
    Node!int node4 = {34, null, null};
    Node!int node5 = {4, null, null};
    Node!int node6 = {60, null, null};
    Node!int node7 = {75, null, null};

    node1.left = &node2;
    node1.right = &node3;
    node2.left = &node4;
    node2.right = &node5;
    node3.left = &node6;
    node6.right = &node7;

    int[] result;
    preOrder!int(&node1, result);
    assert(result == [5, 18, 34, 4, 1, 60, 75]);
    result.length = 0;
    inOrder!int(&node1, result);
    assert(result == [34, 18, 4, 5, 60, 75, 1]);
    result.length = 0;
    postOrder!int(&node1, result);
    assert(result == [34, 4, 18, 75, 60, 1, 5]);
}
