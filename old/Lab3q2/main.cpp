#include <GL/glut.h>
#include <math.h>
#define PI 3.14159

void display() {
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT); // Clear color and depth buffers
	glMatrixMode(GL_MODELVIEW);     // To operate on model-view matrix

 	/*Red Big Suare*/
	glLoadIdentity();                 // Reset the model-view matrix
	glTranslatef(-2.0f, 1.0f, -10.0f);  // Move right and into the screen
	glBegin(GL_POLYGON);
	glColor3f(1.0f, 0.0f, 0.0f);
	glVertex3f(1.0f, 1.0f, 0.0f);
	glVertex3f(-1.0f, 1.0f, 0.0f);
	glVertex3f(-1.0f, -1.0f, 0.0f);
	glVertex3f(1.0f, -1.0f, 0.0f);
	glEnd();

	/*Yellow Hexagon*/
	glLoadIdentity();                 // Reset the model-view matrix
	glTranslatef(1.5f, 2.0f, -15.0f);  // Move right and into the screen
	glRotatef(90.0,0.0,0.0f,1.0f);
	glBegin(GL_POLYGON);
	glColor3f(1.0f, 1.0f, 0.0f);
	for(int i = 0; i < 6; ++i) {
		glVertex2d(sin(i/6.0*2*PI),
		cos(i/6.0*2*PI));
	}

	glEnd();

	/*Green Big Suare*/
	glLoadIdentity();
	glTranslatef(-1.8f, -1.3f, -10.0f);
	glBegin(GL_POLYGON);
	glColor3f(0.0f, 1.0f, 0.0f);
	glVertex3f(1.0f, 1.0f, 0.0f);
	glVertex3f(-1.0f, 1.0f, 0.0f);
	glVertex3f(-1.0f, -1.0f, 0.0f);
	glVertex3f(1.0f, -1.0f, 0.0f);
	glEnd();

	/*B&W Gradient Suare*/
	glLoadIdentity();
	glTranslatef(-2.8f, -2.0f, -10.0f);
	glBegin(GL_POLYGON);
	glColor3f(0.0f, 0.0f, 0.0f);
	glVertex3f(0.5f, 0.5f, 0.0f);
	glColor3f(1.0f, 1.0f, 1.0f);
	glVertex3f(-0.5f, 0.5f, 0.0f);
	glColor3f(0.0f, 0.0f, 0.0f);
	glVertex3f(-0.5f, -0.5f, 0.0f);
	glColor3f(1.0f, 1.0f, 1.0f);
	glVertex3f(0.5f, -0.5f, 0.0f);
	glEnd();

	/*Blue Triangle*/
	glLoadIdentity();
	glTranslatef(1.0f, -2.0f, -10.0f);
	glBegin(GL_TRIANGLES);
	glColor3f(0.0f, 0.0f, 1.0f);
	glVertex3f( 0.0f, 1.8f, 0.0f);
	glVertex3f(-1.0f, 0.0f, 0.0f);
	glVertex3f(1.0f, 0.0f, 0.0f);
	glEnd();

 	/*Colourful Inverted Triangle*/
	glLoadIdentity();
	glTranslatef(2.0f, -2.6f, -10.0f);
	glBegin(GL_TRIANGLES);
	glColor3f(1.0f, 0.0f, 0.0f);
	glVertex3f( 1.0f, 1.0f, 0.0f);
	glColor3f(0.0f, 1.0f, 0.0f);
	glVertex3f(-1.0f, 1.0f, 0.0f);
	glColor3f(0.0f, 0.0f, 1.0f);
	glVertex3f(0.0f, -1.0f, 0.0f);
	glEnd();

	glutSwapBuffers();  // Swap the front and back frame buffers (double buffering)
}

void reshape(GLsizei width, GLsizei height) {  // GLsizei for non-negative integer
	// Compute aspect ratio of the new window
	if (height == 0) height = 1;
	GLfloat aspect = (GLfloat)width / (GLfloat)height;
	glViewport(0, 0, width, height);

	glMatrixMode(GL_PROJECTION);  // To operate on the Projection matrix
	glLoadIdentity();
	// Enable perspective projection with fovy, aspect, zNear and zFar
	gluPerspective(45.0f, aspect, 0.1f, 100.0f);
}

/* Main function: GLUT runs as a console application starting at main() */
int main(int argc, char** argv) {
	glutInit(&argc, argv);            // Initialize GLUT
	glutInitDisplayMode(GLUT_DOUBLE); // Enable double buffered mode
	glutInitWindowSize(640, 480);   // Set the window's initial width & height
	glutInitWindowPosition(900, 500); // Position the window's initial top-left corner
	glutCreateWindow("Q2. Cluster of 3D Shapes");          // Create window with the given title
	glutDisplayFunc(display);       // Register callback handler for window re-paint event
	glutReshapeFunc(reshape);       // Register callback handler for window re-size event

	glutMainLoop();                 // Enter the infinite event-processing loop
	return 0;
}
