//your variable declarations here
Spaceship bob = new Spaceship();
Star[] galaxy;
public void setup()
{
  size(400,400);
  galaxy = new Star[100];
  for(int i = 0; i<galaxy.length; i++)
  {
    galaxy[i] = new Star();
  }
}
public void draw()
{
  background(0);
  bob.show();
  bob.move();
  for(int i = 0; i<galaxy.length; i++)
  {
    galaxy[i].show();
  }
}
public void keyPressed()
{
  if(key == 'a')
  {
    bob.turn(-50);
  }
  else if(key == 'd')
  {
    bob.turn(50);
  }
  else if(key == 'w')
  {
    bob.accelerate(2);
  }
  else if(key == 's')
  {
    bob.accelerate(-2);
  }
  else if (key== ' ')
  {
    bob.hyperspace();
  }
}
