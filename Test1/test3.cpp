
/*
   test2.cpp affichage d'un triangle rouge dans une fenêtre
compilation: g++ test2.cpp -o test2 -lglut -lGLU -lGL
exécution: ./test2
*/
//#include <GL/glut.h>
#include <GL/freeglut.h>
void affiche()
{
	glClear(GL_COLOR_BUFFER_BIT);
	glColor3f(1.0, 0.0, 0.0);
	glBegin(GL_POLYGON);
	glVertex3f(0.0, 0.0, 0.0);
	glVertex3f(0.0, 0.8, 0.0);
	glVertex3f(0.8, 0.4, 0.0);
	glVertex3f(0.8, 0.3, 0.0);
	glVertex3f(0.7, 0.2, 0.0);
	glVertex3f(0.0, 0.0, 0.0);
	glEnd();
	glFlush();
}
int main(int argc, char** argv)
{
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_SINGLE);
	glutInitWindowSize(300, 200);
	glutInitWindowPosition(100, 100);
	glutCreateWindow("OpenGL-Test2");
	glutDisplayFunc(affiche);
	glutMainLoop();
	return 0;
} 
