#include <iostream>

using namespace std;

struct node
{
    string data;
    struct node *ln, *rn;
    bool lt, rt;
};

class TBT
{
    node *dummy, *root;

public:
    TBT();
    node *getDummy();
    node *getRoot();
    void create(string);
    node *add(node *, node *);
    void del(string);
    void search(string);
    void displayInorder(node *);
    void displayPreorder(node *);
    void displayPostorder(node *);
};

TBT::TBT()
{
    dummy = new node;
    root = NULL;
}

node *TBT::getDummy()
{
    return dummy;
}

node *TBT::getRoot()
{
    return root;
}

void TBT::create(string d)
{
    if (root == NULL)
    {
        root = new node;
        root->data = d;
        root->ln = dummy;
        root->lt = true;
        root->rn = dummy;
        root->rt = true;
    }
    else
    {
        node *cn = root;
        while (true)
        {
            if (d.compare(cn->data) < 0)
            {
                if (!cn->lt)
                    cn = cn->ln;
                else
                    break;
            }
            else if (d.compare(cn->data) > 0)
            {
                if (!cn->rt)
                    cn = cn->rn;
                else
                    break;
            }
            else
                cout << "This data already exists\n\n";
            return;
        }

        node *nn = new node;
        nn->data = d;
        if (d.compare(cn->data) < 0)
        {
            nn->ln = cn->ln;
            nn->lt = true;
            nn->rn = cn;
            nn->rt = true;
        }
        else
        {
            nn->rn = cn->rn;
            nn->rt = true;
            nn->ln = cn;
            nn->lt = true;
        }
    }
}

void TBT::displayInorder(node *cn)
{
    while (cn != dummy)
    {
        while (!cn->lt)
        {
            cn = cn->ln;
        }
        cout << cn->data << " ";
        if (cn->rt)
        {
            cn = cn->rn;
            cout << cn->data << " ";
            cn = cn->rn;
        }
        else
        {
            cn = cn->rn;
        }
    }
}

int main()
{
    TBT T;
    int ch, maxCmp = 0;
    string d;
    do
    {
        cout << "1. Add Node\n";
        cout << "2. Delete\n";
        cout << "3. Search\n";
        cout << "4. Display InOrder\n";
        cout << "5. Display PreOrder\n";
        cout << "6. Display PostOrder\n";
        cout << "7. Exit\n";
        cout << "Enter your choice: ";
        cin >> ch;
        cout << endl;

        switch (ch)
        {
        case 1: // add
            cout << "Enter the data: ";
            cin >> d;
            T.create(d);
            break;
        case 2: // delete
            break;
        case 3: // search
            break;
        case 4: // inorder
            T.displayInorder(T.getRoot());
            break;
        case 5: // preorder
            break;
        case 6: // postorder
            break;
        case 7: // exit
            cout << "Exit status: Success\n\n";
            break;
        default: // ch out of bound
            cout << "Please enter your choice between 1 - 7, only!\n\n";
        }
    } while (ch != 7);

    return 0;
}
