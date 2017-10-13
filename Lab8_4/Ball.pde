class Ball
{
  PVector position;
  PVector startingPos;
  PVector accel;
  PVector vel;
  PVector gravity;
  
  boolean alive = false;
  boolean spawned = false;
 
  
  float diameter;
  float angle;
  float force;
  
  int timer;
  
  Ball(float ang, PVector pos)
  {
    angle = ang;
    diameter = 50;
    position = new PVector(pos.x, pos.y);
    startingPos = position.copy();
    force = 41.5;
    gravity = new PVector(0,1);
    vel = new PVector(0,0);
    accel = new PVector(0,0);
    timer = millis();
  }            
  void update()
  {
    
    if(alive == true)
    {      
       applyForce(gravity);
       vel.add(accel);   
       position.add(vel);
       accel.mult(0);
    }
    checkCollision();
  }
  void display()
  {    
    if(alive == true)
    {
      fill(255);
      ellipse(position.x, position.y, diameter, diameter);
      
    }
  }
  void fire()
  {
    if(alive == false)
    {
      if(spawned == false)
      {
        if(millis() - timer > 1400)
        {
          PVector f = PVector.fromAngle(angle);    
          f.mult(force);
          applyForce(f);
          alive = true;   
          timer = millis();
          spawned = true;
        }
      }
      if(spawned == true)
      {
        if(millis() - timer > 4980)
        {
          PVector f = PVector.fromAngle(angle);    
          f.mult(force);
          applyForce(f);
          alive = true;   
          timer = millis();
        }
      }
    }
    
    
  }
  void applyForce(PVector force)
  {    
     PVector f = force.copy();
     accel.add(f);
  }
  void setAngle(float angleIn)
  {
     angle = angleIn; 
  } 
  void checkCollision()
  {
    if(position.y > height)
    {
       alive = false;
       position = startingPos.copy();
       vel.mult(0);
  
    }
  }
 
 
  
  
}