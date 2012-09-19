// Eyedropper example, by Sheiva Rezvani
// www.sheiva.com/itpblog
// Inspired by:

// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com
// Example 15-7: Displaying the pixels of an image

PImage img;
PImage eyedropper;
PFont font;
PFont font2;

void setup() {
  size(400, 266);
  smooth();
  font = loadFont("CooperBlackStd-Italic-48.vlw");
  font2 = loadFont("Emulogic-48.vlw");
  img = loadImage("face.jpg");
  eyedropper = loadImage("eyedropper_16x16.png");
}

void draw() {
  loadPixels();

  // We must also call loadPixels() on the PImage since we are going to read its pixels.
  img.loadPixels();
  for (int y = 0; y < height; y++ ) {
    for (int x = 0; x < width; x++ ) {
      int loc = x + y*width;
      // The functions red(), green(), and blue() pull out the three color components from a pixel.
      float r = red(img.pixels [loc]); 
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);

      // Image Processing would go here
      // If we were to change the RGB values, we would do it here, before setting the pixel in the display window.

      // Set the display pixel to the image pixel
      pixels[loc] = color(r, g, b);
    }
  }


  updatePixels();

  int locMouse = mouseX + mouseY *width;


  float rMouse = red(img.pixels [locMouse]); 
  float gMouse = green(img.pixels[locMouse]);
  float bMouse = blue(img.pixels[locMouse]);

//constantly print out RGB values
//println ("RGB = " + (int) rMouse + ", " + (int) gMouse + ", " + (int) bMouse);

//the eyedropper circle
color c = color( (int) rMouse, (int) gMouse, (int) bMouse);
fill(c);
stroke(0);
ellipse (mouseX, mouseY, 25, 25);



//change the cursor to crosshair or image + print RGB:
if(mousePressed == true) {
    noCursor();
    //print the RGB values in the console on click
    println ("RGB = " + (int) rMouse + ", " + (int) gMouse + ", " + (int) bMouse);
  }
  else {
    //eyedropper cursor:
    cursor(eyedropper, 2, 10);
    //crosshair cursor
    //cursor(CROSS);
  }

//instructions/text for clicking  
textFont(font2, 8); 
String s = "Click for RGB value";
//shadow text
fill(0);
text(s, 11, height - 19);
//regular text
fill(255);
text(s, 10, height - 20);
}

