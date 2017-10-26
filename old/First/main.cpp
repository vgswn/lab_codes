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
    glClearColor(1.0,1.0,1.0,0.0);
    glMatrixMode(GL_MODELVIEW);
    gluOrtho2D(-100.0,100.0,-100.0,100.0);
}
void triangle()
{
    glClear(GL_COLOR_BUFFER_BIT);
    glColor3f(1.0,0.0,0.0);
    /*for(int i=1;i<=720;i++)
    {
        glBegin(GL_TRIANGLE_FAN);
        //glBegin(GL_POINTS);
            glVertex2d(0,0);
            glVertex2d(40,0);
            glVertex2d(40,30);
        glEnd();
        glRotated(0.50,0,0,1.0);
    }
    glRotated(-360,0,0,1);
    glColor3f(0.0,1.0,0.0);
    for(int i=1;i<=1000;i++)
    {
        glBegin(GL_LINES);
            glVertex2d(-50,-50);
            glVertex2d(-50,-80);
        glEnd();
        glTranslated(0.1,0,0);
    }*/
    for(int i=1;i<=24;i++)
    {
        glBegin(GL_QUADS);
            glVertex2d(0,0);
            glVertex2d(20,0);
            glVertex2d(30,20);
            glVertex2d(10,30);
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
