import processing.video.*;
Movie movie;

void setup()
{
  size(800, 600);
  
  movie = new Movie(this, "ballThrow.mp4");
  movie.play();
}

void draw()
{
  image(movie, 0, 0);
}

void movieEvent(Movie m)
{
  m.read();
}