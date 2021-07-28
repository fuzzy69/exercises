module leetcode.mergetwolists;

/*
https://leetcode.com/problems/merge-two-sorted-lists/

21. Merge Two Sorted Lists

Merge two sorted linked lists and return it as a sorted list. The list should be made by splicing together the nodes of the first two lists.

Example 1:

Input: l1 = [1,2,4], l2 = [1,3,4]
Output: [1,1,2,3,4,4]
Example 2:

Input: l1 = [], l2 = []
Output: []
Example 3:

Input: l1 = [], l2 = [0]
Output: [0]

Constraints:

The number of nodes in both lists is in the range [0, 50].
-100 <= Node.val <= 100
Both l1 and l2 are sorted in non-decreasing order.
*/


class ListNode
{
public:
    this (int value = 0, ListNode next = null)
    {
        this.value = value;
        this.next = next;
    }

    int value;
    ListNode next;
}

class Solution
{
    static ListNode mergeTwoLists(ListNode l1, ListNode l2)
    {
        if (l1 is null)
            return l2;
        if (l2 is null)
            return l1;
        ListNode node;
        if (l1.value < l2.value)
        {
            node = l1;
            node.next = Solution.mergeTwoLists(l1.next, l2);
        }
        else
        {
            node = l2;
            node.next = Solution.mergeTwoLists(l1, l2.next);
        }

        return node;
    }
}

unittest
{
    import std.algorithm : equal;

    int[] linkedListToArray(ListNode node)
    {
        int[] result;
        while (node !is null)
        {
            result ~= node.value;
            node = node.next;
        }

        return result;
    }

    ListNode node13 = new ListNode(4);
    ListNode node12 = new ListNode(2, node13);
    ListNode node11 = new ListNode(1, node12);
    ListNode node23 = new ListNode(4);
    ListNode node22 = new ListNode(3, node23);
    ListNode node21 = new ListNode(1, node22);

    assert(equal(linkedListToArray(Solution.mergeTwoLists(node11, node21)), [1, 1, 2, 3, 4, 4]));

    ListNode node1;
    ListNode node2;

    int[] mergedList = linkedListToArray(Solution.mergeTwoLists(node1, node2));
    int[] result = [];
    assert(equal(mergedList, result));

    node1 = null;
    node2 = new ListNode(0);

    mergedList = linkedListToArray(Solution.mergeTwoLists(node1, node2));
    result = [0];
    assert(equal(mergedList, result));
}
