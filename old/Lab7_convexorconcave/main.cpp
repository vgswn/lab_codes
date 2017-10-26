#include <iostream>
#include <bits/stdc++.h>
using namespace std;

int main()
{
    int n,i,j;
    float x,y,z;
    cin>>n;
    float v[n][2];
    for(i=0;i<n;i++)
    {
        cin>>x>>y;
        v[i][0]=x;
        v[i][1]=y;
    }
    float ed[n][2];
    for(i=0;i<n;i++)
    {
        ed[i][0]=v[(i+1)%n][0]-v[i][0];
        ed[i][1]=v[(i+1)%n][1]-v[i][1];
    }
    int flag=0;
    for(i=0;i<n-1;i++)
    {
        z=ed[i][0]*ed[i+1][1]-ed[i][1]*ed[i+1][0];
        if(z<0)
        {
            flag=1;
        }
    }
    if(flag==0)
    {
        cout<<"Convex\n";
    }
    else
    {
        cout<<"Concave\n";
    }
    return 0;
}
