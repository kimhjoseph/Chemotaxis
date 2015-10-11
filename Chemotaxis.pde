Bacteria [] anderson;
boolean click = false;
boolean box = false;
boolean mouseclicked = false;
int squareX, squareY;
void setup()
{
  size(400,400);
  background(0);
  anderson = new Bacteria[30];
  for(int a = 0; a < anderson.length; a++)
  {
    anderson[a] = new Bacteria();
  }
}
void draw()
{
  fill(0, 0, 0, 40);
  stroke(255);
  rect(-1, -1, 401, 401);
  for(int b = 0; b < anderson.length; b++)
  {
    anderson[b].move();
    anderson[b].show();
  }
  if(box == false)
  {
    strokeWeight(1);
    stroke(255);
    rect(mouseX-8, mouseY-8,16,16);
    stroke(255, 0, 255);
    point(mouseX-2, mouseY-3);
    point(mouseX+2, mouseY-3);
    bezier(mouseX-4, mouseY+3, mouseX-3, mouseY, mouseX+3, mouseY, mouseX+4, mouseY+3);
    strokeWeight(1);
  }
  if(box == true)
  {
    strokeWeight(1);
    stroke(255);
    rect(squareX-8, squareY-8,16,16);
    stroke(255, 0, 255);
    point(squareX-2, squareY-3);
    point(squareX+2, squareY-3);
    bezier(squareX-4, squareY+3, squareX-3, squareY, squareX+3, squareY, squareX+4, squareY+3);
    strokeWeight(1);
  }
}
void mousePressed()
{
  if(mouseButton == LEFT)
  {
    click = !click;
  }
  if(mouseButton == RIGHT)
  {
    squareX = mouseX;
    squareY = mouseY;
    box = !box;
    mouseclicked = !mouseclicked;
  }
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
  
  void move()
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


    if(mouseclicked == false)
    {
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
    }
  
    if(mouseclicked == true)
    {
    if(andersonX < squareX)
    {
      andersonX = andersonX + (int)(Math.random()*2);
      andersonY = andersonY + (int)(Math.random()*4-2);
    }
    if(andersonX > squareX)
    {
      andersonX = andersonX + (int)(Math.random()*2-2);
      andersonY = andersonY + (int)(Math.random()*4-2);
    }
    if(andersonY < squareY)
    {
      andersonY = andersonY + (int)(Math.random()*2);
      andersonX = andersonX + (int)(Math.random()*4-2);
    }
    if(andersonY > squareY)
    {
      andersonY = andersonY + (int)(Math.random()*2-2);
      andersonX = andersonX + (int)(Math.random()*4-2);
    }
    }

    andersonX = andersonX + (int)(Math.random()*4-2);
    andersonY = andersonY + (int)(Math.random()*4-2);
  }
  void show()
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
