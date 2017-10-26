#include <GL/glut.h>
#include <iostream>
void init(void)
{
    glClearColor(0.0,0.0,0.0,0.0);
    glClear(GL_COLOR_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);
    gluOrtho2D(-10.0,10.0,-10.0,10.0);
}
void triangle()
{
    glColor3f(1.0,0.0,0.0);
    glBegin(GL_LINES);
        glVertex2f(5.0,1.5);
        glVertex2f(9.3,7.2);
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
