import processing.video.*; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//


Movie video;

int center_w = 1;   // the position of the central bar to copy from.
int movie_h = 1;    // the height of our movie.
int current_x = 0; // marker for drawing the current frame
int count = 1;     // counting the frames, to draw only the ones we need
boolean n_frame = false; // if there is a new frame available.
                         //similar to video.available()

/*
Setting up the window size, which will be the size of our final image
initiating movie and playing it.
Making sure framerate is 24
Increasing it's speed.
Setting global var's for copying movie bars.


*/
void setup() {
  // size(1600,320);
  size(7000, 320);
  video = new Movie(this, "origins.avi");
  video.play();
 // video.frameRate(1);
  video.frameRate(24);
  video.speed(1920);
  center_w = video.height/2;
  movie_h = video.height;
}


/*
Reading the current frame.
Setting global n_frame true since we have a new frame.
*/
void movieEvent(Movie video)
{
  video.read();
  n_frame = true;
  //<>//
}

/*
The main function for drawing.
*/
void draw()
{
  if (n_frame) 
  { 
    count++;   // If we have a new frame increase the counter
    if (video.time() >= video.duration()-5)
    {  /*If the movie is near the end let's save an image and exit
        To be save we check 5 second's before it.
         Another option would be to save in every 10 mins,
        */
      save("output6.jpg");
      exit();
    }
    //if(count%96 == 0)
    if (count%24 == 0)     
    {   /* copying a bar in each x frames. 
           if we want to copy at each second: x = 24.
        */
      copy(video, center_w, 0, 1, movie_h, current_x, 0, 1, movie_h);
      current_x++;  //increasing the indent for the next bar,
    }
  }
  n_frame = false; // we are finished dealing with the current frame.
}