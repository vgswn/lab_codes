#include <GL/glut.h>
#include <iostream>
using namespace std;
void init(void)
{
    glClearColor(0.0,0.0,0.0,0.0);
    glClear(GL_COLOR_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);
    gluOrtho2D(-100.0,100.0,-100.0,100.0);
}
void mul(float r[3][3],float p[2])
{
    float ans[3][1],ta[3][1];
    ans[0][0]=p[0];
    ans[1][0]=p[1];
    ans[2][0]=1;
    int i,j,k;
    for(i=0;i<3;i++)
    {
        for(j=0;j<1;j++)
        {
            ta[i][j]=0;
            for(k=0;k<3;k++)
            {
                ta[i][j]+=r[i][k]*ans[k][j];
            }
        }
    }
    p[0]=ta[0][0];
    p[1]=ta[0][1];
}
void triangle()
{
    int i;
    glColor3f(0.0,1.0,0.0);
    glBegin(GL_LINES);
        glVertex2d(-80,0);
        glVertex2d(80,0);
        glVertex2d(0,-80);
        glVertex2d(0,80);
    glEnd();
    float p1[2]={-5,-35};
    float p2[2]={-5,-5};
    float p3[2]={-35,-5};
    float p4[2]={-35,-35};
    glColor3f(1.0,0.0,0.0);
    glBegin(GL_QUADS);
        glVertex2fv(p1);
        glVertex2fv(p2);
        glVertex2fv(p3);
        glVertex2fv(p4);
    glEnd();

    float ref[3][3]={{1,0,0},{0,-1,0},{0,0,1}};
    mul(ref,p1);
    mul(ref,p2);
    mul(ref,p3);
    mul(ref,p4);

    float ref1[3][3]={{1,0,20},{0,1,-20},{0,0,1}};
    mul(ref1,p1);
    mul(ref1,p2);
    mul(ref1,p3);
    mul(ref1,p4);


    float ref2[3][3]={{0.7071,-0.7071,0},{0.7071,0.7071,0},{0,0,1}};
    mul(ref2,p1);
    mul(ref2,p2);
    mul(ref2,p3);
    mul(ref2,p4);

    float ref3[3][3]={{1,0,-20},{0,1,20},{0,0,1}};
    mul(ref3,p1);
    mul(ref3,p2);
    mul(ref3,p3);
    mul(ref3,p4);

    float ref5[3][3]={{1,0,20},{0,1,-20},{0,0,1}};
    mul(ref5,p1);
    mul(ref5,p2);
    mul(ref5,p3);
    mul(ref5,p4);




    float ref4[3][3]={{0.7071,0.7071,0},{-0.7071,0.7071,0},{0,0,1}};
    mul(ref4,p1);
    mul(ref4,p2);
    mul(ref4,p3);
    mul(ref4,p4);

    float ref6[3][3]={{1,0,0},{0,1,(14.9997)},{0,0,1}};
    mul(ref6,p1);
    mul(ref6,p2);
    mul(ref6,p3);
    mul(ref6,p4);

    float ref7[3][3]={{1,0,(14.9997)/2.0},{0,1,0},{0,0,1}};
    mul(ref7,p1);
    mul(ref7,p2);
    mul(ref7,p3);
    mul(ref7,p4);




    float ref8[3][3]={{1,2,0},{0,1,0},{0,0,1}};
    mul(ref8,p1);
    mul(ref8,p2);
    mul(ref8,p3);
    mul(ref8,p4);

    float ref9[3][3]={{1,0,(-14.9997)/2.0},{0,1,0},{0,0,1}};
    mul(ref9,p1);
    mul(ref9,p2);
    mul(ref9,p3);
    mul(ref9,p4);


    float ref10[3][3]={{1,0,0},{0,1,(-14.9997)},{0,0,1}};
    mul(ref10,p1);
    mul(ref10,p2);
    mul(ref10,p3);
    mul(ref10,p4);


        float ref11[3][3]={{0.7071,-0.7071,0},{0.7071,0.7071,0},{0,0,1}};
    mul(ref11,p1);
    mul(ref11,p2);
    mul(ref11,p3);
    mul(ref11,p4);



    float ref12[3][3]={{1,0,-20},{0,1,20},{0,0,1}};
    mul(ref12,p1);
    mul(ref12,p2);
    mul(ref12,p3);
    mul(ref12,p4);

    glColor3f(1.0,0.0,0.0);
    glBegin(GL_QUADS);
        glVertex2fv(p1);
        glVertex2fv(p2);
        glVertex2fv(p3);
        glVertex2fv(p4);
    glEnd();


    cout<<p1[0]<<" "<<p1[1]<<endl;
     cout<<p2[0]<<" "<<p2[1]<<endl;
     cout<<p3[0]<<" "<<p3[1]<<endl;
     cout<<p4[0]<<" "<<p4[1]<<endl;

    glFlush();
}
int main(int argc,char ** argv)
{
    cout<<"hello";
    glutInit(&argc,argv);
    glutInitDisplayMode(GLUT_SINGLE|GLUT_RGB);
    glutInitWindowPosition(50,100);
    glutInitWindowSize(500,500);
    glutCreateWindow("Line");
    init();
    glutDisplayFunc(triangle);
    glutMainLoop();
}
