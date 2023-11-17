class Star //note that this class does NOT extend Floater
{
  private double myX, myY, mySize;
  public Star()
  {
    myX = Math.random()*400;
    myY = Math.random()*400;
    mySize = Math.random()*4;
  }
  public void show()
  {
    fill(255);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
}
