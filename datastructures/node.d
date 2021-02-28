module datastructures.node;


struct Node(T)
{
    T value;
    Node *left;
    Node *right;
}
