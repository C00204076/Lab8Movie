import processing.video.*;
Movie movie;

void setup()
{
  size(1900, 1050);
  
  movie = new Movie(this, "ballThrow.mp4");
  movie.loop();
}

void draw()
{
  image(movie, 0, 0);
}

void movieEvent(Movie m)
{
  m.read();
}