#include <GL/glut.h>
#include <math.h>
#include <iostream>
void init(void)
{
    glClearColor(0.0,0.0,0.0,0.0);
    glClear(GL_COLOR_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);
    gluOrtho2D(-20.0,20.0,-3.0,3.0);
}
void triangle()
{
    glColor3f(1.0,0.0,0.0);
    glBegin(GL_LINES);
        glVertex2d(-15,0);
        glVertex2d(15,0);
        glVertex2d(0,-2);
        glVertex2d(0,2);
    glEnd();
    glBegin(GL_LINE_STRIP);
    float i,x,y;
    for(i=-10;i<=10;i+=0.25)
    {
        x=i;
        if(i==0.0)
        {
            y=1.0;
        }
        else
        {
            y=sin(3.14*x)/(3.14*x);
        }
        glVertex2f(x,y);
    }
    glEnd();
    glFlush();
}
int main(int argc,char ** argv)
{
    glutInit(&argc,argv);
    glutInitDisplayMode(GLUT_SINGLE|GLUT_RGB);
    glutInitWindowPosition(50,100);
    glutInitWindowSize(400,400);
    glutCreateWindow("Line");
    init();
    glutDisplayFunc(triangle);
    glutMainLoop();
}
