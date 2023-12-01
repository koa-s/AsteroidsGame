Spaceship bob = new Spaceship();
ArrayList <Asteroid> belt;
Star[] galaxy;

boolean wIsPressed = false;
boolean aIsPressed = false;
boolean sIsPressed = false;
boolean dIsPressed = false;

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

public void keyPressed()
{
  if (key == 'a')
  {
    aIsPressed = true;
  } else if (key == 'd')
  {
    dIsPressed = true;
  } else if (key == 'w')
  {
    wIsPressed = true;
  } else if (key == 's')
  {
    sIsPressed = true;
  } else if (key== ' ')
  {
    bob.hyperspace();
  }
}
public void keyReleased()
{
  if (key == 'a')
  {
    aIsPressed = false;
  } else if (key == 'd')
  {
    dIsPressed = false;
  } else if (key == 'w')
  {
    wIsPressed = false;
  } else if (key == 's')
  {
    sIsPressed = false;
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
    double d = dist((float)bob.getX(), (float)bob.getY(), (float)belt.get(i).getX(), (float)belt.get(i).getY());
    if (d<20)
    {
      belt.remove(i);
    }
    if (wIsPressed==true && dIsPressed==true)
    {
      bob.turn(1);
      bob.accelerate(0.01);
    }
    if (wIsPressed==true && aIsPressed==true)
    {
      bob.turn(-1);
      bob.accelerate(0.01);
    }
    if (wIsPressed==false && dIsPressed==true)
    {
      bob.turn(1);
    }
    if (aIsPressed==true && wIsPressed==false)
    {
      bob.turn(-1);
    }
    if (wIsPressed==true && aIsPressed==false && dIsPressed == false)
    {
      bob.accelerate(0.01);
    }
    if (sIsPressed==true && dIsPressed==true)
    {
      bob.turn(1);
      bob.accelerate(-0.01);
    }
    if (sIsPressed==true && aIsPressed==true)
    {
      bob.turn(-1);
      bob.accelerate(-0.01);
    }
    if (sIsPressed==true && aIsPressed==false && dIsPressed == false)
    {
      bob.accelerate(-0.01);
    }
  }
}
