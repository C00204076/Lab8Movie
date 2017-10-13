import processing.video.*;
Movie movie;
Ball ball;
boolean test = false;
 
void setup()
{
  background(0);
  size(1900, 1050);
  
  movie = new Movie(this, "ballThrow.mp4");
  movie.play();
  ball = new Ball(5.35,new PVector(100,height));
  movie.speed(0.5);
  movie.loop();
  
}
void update()
{  
    ball.update(); 
    ball.fire();  
}
void draw()
{
  update();
 
  //background(0);
  image(movie, 0, 0);
  ball.display(); 
  
  
  fill(255,0,0);
  //for testing
  ellipse(width/2, 500, 50, 50);
  ellipse(100,height,50,50);
  ellipse(width-150,height,50,50);
}
void mousePressed() {
  if(test == false)
  {
    movie.pause();  
    test = true;
  }
  else
  {
     movie.play();
     test = false;
  }
  
}
void movieEvent(Movie m)
{
  m.read();
}
 