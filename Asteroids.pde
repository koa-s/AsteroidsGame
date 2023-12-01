class Asteroid extends Floater
{
  double turnSpeed;
  int multiplier;
  Asteroid()
  {
    multiplier = (int)(Math.random()*2+1);
    corners = 10;  //the number of corners, a triangular floater has 3  
    xCorners = new int[corners];  
    yCorners = new int[corners];
    xCorners[0] = 0*multiplier;
    xCorners[1] = 5*multiplier;
    xCorners[2] = 7*multiplier;
    xCorners[3] = 9*multiplier;
    xCorners[4] = 4*multiplier;
    xCorners[5] = -3*multiplier;
    xCorners[6] = -10*multiplier;
    xCorners[7] = -8*multiplier;
    xCorners[8] = -9*multiplier;
    xCorners[9] = -7*multiplier;
    yCorners[0] = 10*multiplier;
    yCorners[1] = 11*multiplier;
    yCorners[2] = 6*multiplier;
    yCorners[3] = 1*multiplier;
    yCorners[4] = -2*multiplier;
    yCorners[5] = -5*multiplier;
    yCorners[6] = -2*multiplier;
    yCorners[7] = 3*multiplier;
    yCorners[8] = 6*multiplier;
    yCorners[9] = 11*multiplier;
    myColor = color(202, 202, 217);  
    myCenterX = Math.random()*200;
    myCenterY = Math.random()*200;
    myXspeed = Math.random()*4-2;
    myYspeed = Math.random()*4-2; //holds the speed of travel in the x and y directions  
    myPointDirection = Math.random()*360; //holds current direction the ship is pointing in degrees
    turnSpeed = Math.random()*3-1.5;
  }
  public void fly()
  {
    super.move();
    turn(turnSpeed);
  }
  public double getX()
  {
    return myCenterX;
  }
  public double getY()
  {
    return myCenterY;
  }
}
