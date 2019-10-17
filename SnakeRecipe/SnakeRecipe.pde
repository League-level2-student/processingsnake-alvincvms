
// 1. Follow the recipe instructions inside the Segment class.

// The Segment class will be used to represent each part of the moving snake.

class Segment {

  //2. Create x and y member variables to hold the location of each segment.
  int sX;
  int sY;
  // 3. Add a constructor with parameters to initialize each variable.
  Segment(int x, int y){
    sX = x;
    sY = y;
  }

  // 4. Add getter and setter methods for both the x and y member variables.
  int getsX(){
    return sX;
  }
  int getsY(){
    return sY;
  }
}


// 5. Create (but do not initialize) a Segment variable to hold the head of the Snake
Segment head;


// 6. Create and initialize a String to hold the direction of your snake e.g. "up"
String dir = "up";


// 7. Create and initialize a variable to hold how many pieces of food the snake has eaten.
// give it a value of 1 to start.
int foodEaten = 1;


// 8. Create and initialize foodX and foodY variables to hold the location of the food.

// (Hint: use the random method to set both the x and y to random locations within the screen size (500 by 500).)

int foodX = ((int)random(50)*10);
int foodY = ((int)random(50)*10);


void setup() {

  // 9. Set the size of your sketch (500 by 500).

  size(500, 500);


  // 10. initialize your head to a new segment.
  head = new Segment(250,250);

  // 11. Use the frameRate(int rate) method to set the rate to 20.
  frameRate(20);
}


void draw() {

  background(0);


  //12. Call the manageTail, drawFood, drawSnake, move, and collision methods.
  manageTail();
  drawFood();
  drawSnake();
  move();
  collision();
}


// 13. Complete the drawFood method below. (Hint: each piece of food should be a 10 by 10 rectangle).

void drawFood() {
  rect(foodX,foodY,10,10);
}


//14. Draw the snake head (use a 10 by 10 rectangle)

void drawSnake() {
  
  rect(head.getsX(), head.getsY(), 10, 10);

  //test your code
}


// 15. Complete the move method below.

void move() {

  // 16. Using a switch statement, make your snake head move by 10 pixels in the correct direction.
  //This is an incomplete switch statement:
  
  switch(dir) {
  case "up":
    // move head up here 
    head = new Segment(head.getsX(),head.getsY()-10);
    break;
  case "down":
    // move head down here 
    head = new Segment(head.getsX(),head.getsY()+10);
    break;
  case "left":
    // figure it out 
    head = new Segment(head.getsX()-10,head.getsY());
    break;
  case "right":
    // mystery code goes here 
    head = new Segment(head.getsX()+10,head.getsY());
    break;
  }
  


  // 17. Call the checkBoundaries method to make sure the snake head doesn't go off the screen.
  checkBoundaries();
}


// 18. Complete the keyPressed method below. Use if statements to set your direction variable depending on what key is pressed.

void keyPressed() {
  
    if(key == CODED){
      if(keyCode == UP && dir != "down"){
        dir = "up";
      }
      if(keyCode == DOWN && dir != "up"){
        dir = "down";
      }
      if(keyCode == LEFT && dir != "right"){
        dir = "left";
      }
      if(keyCode == RIGHT && dir != "left"){
        dir = "right";
      }
    }
  
}



// 19. check if your head is out of bounds (teleport your snake head to the other side).

void checkBoundaries() {
  if(head.getsX() < 0){
    head = new Segment(500, head.getsY());
  }
  if(head.getsX() > 500){
    head = new Segment(0, head.getsY());
  }
  if(head.getsY() < 0){
    head = new Segment(head.getsX(), 500);
  }
  if(head.getsY() > 500){
    head = new Segment(head.getsX(), 0);
  }
}



//20. Make sure that the key for your current direction’s opposite doesn’t work(i.e. If you’re going up, down key shouldn’t work)



// 21. Complete the missing parts of the collision method below.

void collision() {

  // If the segment is colliding with a piece of food...
  if(head.getsX() == foodX && head.getsY() == foodY){
     // Increase the amount of food eaten and set foodX and foodY to new random locations.
     foodEaten += 1;
     foodX = ((int)random(50)*10);
     foodY = ((int)random(50)*10);
  }
}



/**
 
 ** Part 2: making the tail (the rest of the snake)
 
 **/

//  1. Create and initialize an ArrayList of Segments. (This will be your snake tail!)

ArrayList<Segment> tail = new ArrayList<Segment>();
// 2. Complete the missing parts of the manageTail method below and call it in the draw method.

void manageTail() {

  //Call the drawTail and checkTailCollision methods.
  checkTailCollision();
  drawTail();
  checkTailCollision();
  // Add a new Segment to your ArrayList that has the same X and Y as the head of your snake.
  tail.add(new Segment(head.getsX(), head.getsY()));
  // To keep your tail the right length:
  // while the tail size is greater than the number of food pieces eaten, remove the first Segment in your tail.
  while(tail.size() > foodEaten){
    tail.remove(0);
  }
}

void drawTail() {
    // Draw a 10 by 10 rectangle for each Segment in your snake ArrayList.
    for(Segment s : tail){
      
      rect(s.getsX(), s.getsY(), 10, 10);
    }
}


// 3. Complete the missing parts of the bodyCollision method below.

void checkTailCollision() {

  // If your head has the same location as one of your segments...
  for(Segment s : tail){
  if(head.getsX() == s.getsX() && head.getsY() == s.getsY()){
  // reset your food variable
  foodEaten = 1;
  }  //Call this method at the beginning of your manageTail method.
  }
}
