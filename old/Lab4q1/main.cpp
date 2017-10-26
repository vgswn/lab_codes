/*
 * GLUT Shapes Demo
 *
 * Written by Nigel Stewart November 2003
 *
 * This program is test harness for the sphere, cone
 * and torus shapes in GLUT.
 *
 * Spinning wireframe and smooth shaded shapes are
 * displayed until the ESC or q key is pressed.  The
 * number of geometry stacks and slices can be adjusted
 * using the + and - keys.
 */

#include <GL/glut.h>
#include <iostream>
void init(void)
{
    glClearColor(0.0,0.0,0.0,0.0);
    glMatrixMode(GL_MODELVIEW);
    gluOrtho2D(-100.0,100.0,-100.0,100.0);
}
void triangle()
{
    glClear(GL_COLOR_BUFFER_BIT);
    //glLoadIdentity();
   /* glColor3f(1.0,0.0,0.0);
    glBegin(GL_TRIANGLES);
        glVertex2i(0,0);
        glVertex2i(0,50);
        glVertex2i(50,0);
    glEnd();
    glPopMatrix();
    glColor3f(0.0,0.0,1.0);
    glPushMatrix();
    glRotated(90,0,0,1);
    glRotated(90,0.0,0.0,1.0);
    glBegin(GL_TRIANGLES);
        glVertex2i(0,0);
        glVertex2i(0,50);
        glVertex2i(50,0);
    glEnd();
    glPopMatrix();*/
    glColor3f(1.0,0.0,0.0);
    int i;
    for(i=1;i<=2400;i++)
    {
        glBegin(GL_LINES);
            //glVertex2i(0,0);
            glVertex2i(30,30);
            glVertex2i(40,40);
        glEnd();
        glRotated(0.15,0,0,1.0);
        if((i/100)%2==0)
        {
            glColor3f(0.0,0.0,1.0);
        }
        else
        {
            glColor3f(1.0,0.0,0.0);
        }
        glBegin(GL_LINES);
            glVertex2i(0,0);
            glVertex2i(30,30);
        glEnd();
    }
    glRotated(-360,0,0,1.0);
    glColor3f(0.0,0.0,0.0);
    for(i=1;i<=2400;i++)
    {
        glBegin(GL_LINES);
            glVertex2i(0,0);
            glVertex2i(20,20);
        glEnd();
        glRotated(0.15,0,0,1.0);
    }
    glRotated(-360,0,0,1.0);
    glColor3f(0.0,1.0,0.0);
    for(i=1;i<=2400;i++)
    {
        glBegin(GL_LINES);
            glVertex2i(0,0);
            glVertex2i(10,10);
        glEnd();
        glRotated(0.15,0,0,1.0);
    }
    glRotated(-360,0,0,1.0);
    glColor3f(1.0,1.0,1.0);
    for(i=1;i<=24;i++)
    {
        glBegin(GL_LINES);
            glVertex2i(0,0);
            glVertex2i(20,20);
        glEnd();
        glRotated(15,0,0,1.0);
    }
    glFlush();
}
int main(int argc,char ** argv)
{
    glutInit(&argc,argv);
    glutInitDisplayMode(GLUT_SINGLE|GLUT_RGB);
    glutInitWindowPosition(50,100);
    glutInitWindowSize(400,400);
    glutCreateWindow("Hey");
    init();
    glutDisplayFunc(triangle);
    glutMainLoop();
}
