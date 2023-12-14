Spaceship bob = new Spaceship();
ArrayList <Asteroid> belt;
Star[] galaxy;
ArrayList <Bullet> spray;

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
  spray = new ArrayList <Bullet>();
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
  } else if (key=='f')
  {
    spray.add(new Bullet(bob));
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

    if (d<25)
    {
      belt.remove(i);
    }
  }
  for (int i = 0; i<spray.size(); i++)
  {
    spray.get(i).show();
    spray.get(i).move();
    if (spray.get(i).getX()>400 || spray.get(i).getX()<0 || spray.get(i).getY()>400 || spray.get(i).getY()<0)
    {
      spray.remove(i);
      i--;
    }
  }  
  for (int i = 0; i<belt.size(); i++)
  {
    for (int j = 0; j<spray.size(); j++)
    {
      double distance = dist((float)spray.get(j).getX(), (float)spray.get(j).getY(), (float)belt.get(i).getX(), (float)belt.get(i).getY());
      if (distance<15)
      {
        belt.remove(i);
        spray.remove(j);
        j=spray.size();
        i--;
      }
    }
  }
  if (wIsPressed==true && dIsPressed==true)
  {
    bob.turn(3);
    bob.accelerate(0.05);
  }
  if (wIsPressed==true && aIsPressed==true)
  {
    bob.turn(-3);
    bob.accelerate(0.05);
  }
  if (wIsPressed==false && dIsPressed==true)
  {
    bob.turn(3);
  }
  if (aIsPressed==true && wIsPressed==false)
  {
    bob.turn(-3);
  }
  if (wIsPressed==true && aIsPressed==false && dIsPressed == false)
  {
    bob.accelerate(0.05);
  }
  if (sIsPressed==true && dIsPressed==true)
  {
    bob.turn(3);
    bob.accelerate(-0.05);
  }
  if (sIsPressed==true && aIsPressed==true)
  {
    bob.turn(-3);
    bob.accelerate(-0.05);
  }
  if (sIsPressed==true && aIsPressed==false && dIsPressed == false)
  {
    bob.accelerate(-0.05);
  }
}
