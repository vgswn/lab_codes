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
    float tri[3][2]={{0,0},{30,0},{15,25.9807}};
    for(int i=0;i<4;i++){
        glBegin(GL_LINE_LOOP);
        glVertex2fv(tri[0]);
        glVertex2fv(tri[1]);
        glVertex2fv(tri[2]);
        glEnd();
        glTranslated(30,0,0);
        glRotated(-90,0,0,1);
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
