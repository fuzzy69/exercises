module leetcode.reverselinkedlist;

/*
https://leetcode.com/problems/reverse-linked-list/

206. Reverse Linked List

Given the head of a singly linked list, reverse the list, and return the reversed list.

 

Example 1:


Input: head = [1,2,3,4,5]
Output: [5,4,3,2,1]
Example 2:


Input: head = [1,2]
Output: [2,1]
Example 3:

Input: head = []
Output: []
 

Constraints:

The number of nodes in the list is the range [0, 5000].
-5000 <= Node.val <= 5000
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
    static ListNode reverseLinkedList(ListNode head)
    {
        if (head is null || head.next is null)
            return head;
        ListNode previousNode = null;
        ListNode currentNode = head;
        while (currentNode)
        {
            ListNode node = currentNode.next;
            currentNode.next = previousNode;
            previousNode = currentNode;
            currentNode = node;
        }

        return previousNode;
    }
}

unittest
{
    import std.algorithm : equal;

    int[] linkedListToArray(ListNode node)
    {
        int[] result;
        if (node !is null)
        {
            result ~= node.value;
            do
            {
                node = node.next;
                result ~= node.value;
            } while (node.next);
        }

        return result;
    }

    void reverseArray(int[] arr)
    {
        if (arr.length > 1)
        {
            ulong leftIndex = 0;
            ulong rightIndex = arr.length - 1;
            while (leftIndex < rightIndex)
            {
                int tmp = arr[leftIndex];
                arr[leftIndex] = arr[rightIndex];
                arr[rightIndex] = tmp;
                ++leftIndex;
                --rightIndex;
            }
        }
    }

    ListNode node5 = new ListNode(5);
    ListNode node4 = new ListNode(4, node5);
    ListNode node3 = new ListNode(3, node4);
    ListNode node2 = new ListNode(2, node3);
    ListNode node1 = new ListNode(1, node2);

    int[] nodeValues = linkedListToArray(node1);
    node1 = Solution.reverseLinkedList(node1);
    int[] nodeResult = linkedListToArray(node1);
    reverseArray(nodeResult);
    assert(equal(nodeValues, nodeResult));

    node2 = new ListNode(2);
    node1 = new ListNode(1, node2);

    nodeValues = linkedListToArray(node1);
    node1 = Solution.reverseLinkedList(node1);
    nodeResult = linkedListToArray(node1);
    reverseArray(nodeResult);
    assert(equal(nodeValues, nodeResult));

    node1 = null;

    nodeValues = linkedListToArray(node1);
    node1 = Solution.reverseLinkedList(node1);
    nodeResult = linkedListToArray(node1);
    reverseArray(nodeResult);
    assert(equal(nodeValues, nodeResult));
}
