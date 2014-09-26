import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Chemotaxis extends PApplet {

Bacteria [] anderson;
boolean click = false;
public void setup()
{
	size(400,400);
	background(0);
	anderson = new Bacteria[30];
	for(int a = 0; a < anderson.length; a++)
	{
		anderson[a] = new Bacteria();
	}
}
public void draw()
{
	for(int b = 0; b < anderson.length; b++)
	{
		anderson[b].move();
		anderson[b].show();
	}
	fill(0,0,0,40);
	stroke(255);
	rect(-1, -1, 401, 401);
	rect(mouseX-5,mouseY-5,10,10);
}
public void mouseClicked()
{

	click = !click;
}
class Bacteria
{
	int andersonSizeX, andersonSizeY, andersonX, andersonY;
	Bacteria()
	{
		andersonSizeX = 20;
		andersonSizeY = 20;
		andersonX = (int)(Math.random()*400);
		andersonY = (int)(Math.random()*400);
	}
	public void move()
	{
		if(click == true)
		{
			andersonX = (int)(Math.random()*400);
			andersonY = (int)(Math.random()*400);
		}

		if(andersonX <= 5)
		{
			andersonX = andersonX + (int)(Math.random()*2);
		}
		if(andersonX >= 395)
		{
			andersonX = andersonX + (int)(Math.random()*2-2);
		}
		if(andersonY <= 5)
		{
			andersonY = andersonY + (int)(Math.random()*2);
		}
		if(andersonY >= 395)
		{
			andersonY = andersonY + (int)(Math.random()*2-2);
		}

		if(andersonX < mouseX)
		{
			andersonX = andersonX + (int)(Math.random()*2);
			andersonY = andersonY + (int)(Math.random()*4-2);
		}
		if(andersonX > mouseX)
		{
			andersonX = andersonX + (int)(Math.random()*2-2);
			andersonY = andersonY + (int)(Math.random()*4-2);
		}
		if(andersonY < mouseY)
		{
			andersonY = andersonY + (int)(Math.random()*2);
			andersonX = andersonX + (int)(Math.random()*4-2);
		}
		if(andersonY > mouseY)
		{
			andersonY = andersonY + (int)(Math.random()*2-2);
			andersonX = andersonX + (int)(Math.random()*4-2);
		}
	

		andersonX = andersonX + (int)(Math.random()*4-2);
		andersonY = andersonY + (int)(Math.random()*4-2);
	}
	public void show()
	{
		noFill();
		stroke(255,255,255);
		ellipse(andersonX, andersonY, andersonSizeX, andersonSizeY);
		stroke(0, 255, 255);
		point(andersonX-2, andersonY-2);
		point(andersonX+2, andersonY-2);
		bezier(andersonX-4, andersonY+2, andersonX-3, andersonY+5, andersonX+3, andersonY+5, andersonX+4, andersonY+2);
	}
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Chemotaxis" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
