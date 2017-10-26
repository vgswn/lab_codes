#include <GL/glut.h>
#include <iostream>
void init(void)
{
    glClearColor(0.0,0.0,0.0,0.0);
    glMatrixMode(GL_MODELVIEW);
    gluOrtho2D(-250.0,250.0,-250.0,250.0);
}
void dp(int x)
{
    int i;
    glScaled(2,1,0);
    for(i=1;i<=1440;i++)
    {
        glColor3f(0,0,0);
        glBegin(GL_LINES);
            glVertex2d(0,0);
            glVertex2d(9.5,9.5);
        glEnd();
        if(x==1)
        {
            glColor3f(1,0,0);
        }
        else if(x==2)
        {
            glColor3f(0,1,0);
        }
        else
        {
            glColor3f(0,0,1);
        }
        glBegin(GL_LINES);
            glVertex2d(9.5,9.5);
            glVertex2d(10,10);
        glEnd();
        glRotated(0.25,0,0,1);
    }
    glScaled(0.5,1,0);

    for(i=1;i<=1440;i++)
    {
        if(i<=720)
        {
            glColor3f(0,0,0);
            glBegin(GL_LINES);
                glVertex2d(0,0);
                glVertex2d(0,13.5);
            glEnd();
        if(x==1)
        {
            glColor3f(1,0,0);
        }
        else if(x==2)
        {
            glColor3f(0,1,0);
        }
        else
        {
            glColor3f(0,0,1);
        }
            glBegin(GL_LINES);
                glVertex2d(0,13.5);
                glVertex2d(0,14.142);
            glEnd();
        }
        glRotated(0.25,0,0,1);
    }



        if(x==1)
        {
            glColor3f(1,0,0);
        }
        else if(x==2)
        {
            glColor3f(0,1,0);
        }
        else
        {
            glColor3f(0,0,1);
        }
    glBegin(GL_LINE_LOOP);
        glVertex2f(28.284,0);
        glVertex2f(42.426,0);
        glVertex2f(42.426,14.142);
    glEnd();

    glBegin(GL_LINE_LOOP);
        glVertex2f(0,0);
        glVertex2f(-14.142/4,14.142*2);
        glVertex2f(14.142/4,14.142*2);
    glEnd();
    glRotated(-30,0,0,1);
    glBegin(GL_LINE_LOOP);
        glVertex2f(0,0);
        glVertex2f(-14.142/4,14.142*2);
        glVertex2f(14.142/4,14.142*2);
    glEnd();
    glRotated(-150,0,0,1);
    glBegin(GL_LINE_LOOP);
        glVertex2f(0,0);
        glVertex2f(-14.142/4,14.142*2);
        glVertex2f(14.142/4,14.142*2);
    glEnd();

    glRotated(180,0,0,1);
}
void triangle()
{
    glClear(GL_COLOR_BUFFER_BIT);
    dp(1);
    int i;
    glTranslated(-50,-100,0);
    dp(2);
    glTranslated(50,100,0);

    glTranslated(50,-120,0);
    dp(3);
    glTranslated(-50,120,0);

    glTranslated(-60,120,0);
    dp(3);
    glTranslated(60,-120,0);


    glTranslated(90,140,0);
    dp(2);
    glTranslated(-90,-140,0);

    glTranslated(-150,150,0);
    dp(2);
    glTranslated(150,-150,0);
    glTranslated(-150,-150,0);
    dp(3);
    glTranslated(150,150,0);

    glTranslated(50,50,0);
    dp(2);
    glTranslated(-50,-50,0);

    glTranslated(120,40,0);
    dp(3);
    glTranslated(-120,-40,0);

    glTranslated(-100,40,0);
    dp(2);
    glTranslated(100,-40,0);

    glTranslated(-150,80,0);
    dp(3);
    glTranslated(150,-80,0);


    glTranslated(100,-200,0);
    dp(3);
    glTranslated(-100,200,0);

    glTranslated(-100,-200,0);
    dp(1);
    glTranslated(100,200,0);


    glFlush();
}
int main(int argc,char ** argv)
{
    glutInit(&argc,argv);
    glutInitDisplayMode(GLUT_SINGLE|GLUT_RGB);
    glutInitWindowPosition(50,100);
    glutInitWindowSize(500,500);
    glutCreateWindow("Hey");
    init();
    glutDisplayFunc(triangle);
    glutMainLoop();
}
