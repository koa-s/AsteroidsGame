Spaceship bob = new Spaceship();
ArrayList <Asteroid> belt;
Star[] galaxy;
public void setup()
{
  size(400, 400);
  galaxy = new Star[100];
  belt = new ArrayList <Asteroid>();
  for (int i = 0; i<galaxy.length; i++)
  {
    galaxy[i] = new Star();
  }
  for (int i = 0; i<15; i++)
  {
    belt.add(new Asteroid());
  }
}
public void draw()
{
  background(0);
  bob.show();
  bob.move();
  for (int i = 0; i<galaxy.length; i++)
  {
    galaxy[i].show();
  }
  for (int i = 0; i<belt.size(); i++)
  {
    belt.get(i).show();
    belt.get(i).fly();
    double d = dist((float)bob.getX(),(float)bob.getY(),(float)belt.get(i).getX(),(float)belt.get(i).getY());
    if(d<15)
    {
      belt.remove(i);
    }
  }
  System.out.println(belt.size());
}
public void keyPressed()
{
  if (key == 'a')
  {
    bob.turn(-50);
  } else if (key == 'd')
  {
    bob.turn(50);
  } else if (key == 'w')
  {
    bob.accelerate(1);
  } else if (key == 's')
  {
    bob.accelerate(-1);
  } else if (key== ' ')
  {
    bob.hyperspace();
  }
}
