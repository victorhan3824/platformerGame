class FPlayer extends FBox{
  int lives;
  
  FPlayer() {
    //initalize location + display
    super(gridSize, gridSize);
    setPosition(300,0); //inital position
    setFillColor(red);
    
    //stat initalize
    lives = 5;
  }
  
  void act() {
    moveByControl();
    checkCollision();
    statDisplay();
  }
  
  void statDisplay() {
    for (int i=0; i<this.lives; i++) {
      image(heart, 500+i*32,16);  
    }
  }
  
  void moveByControl() {
    float vx = this.getVelocityX();
    float vy = this.getVelocityY();
    if (aKey) setVelocity(-300, vy);
    if (dKey) setVelocity(300,  vy);
    if (wKey) setVelocity(vx, -300);
    if (sKey) setVelocity(vx, 300);
  }
  
  void checkCollision() {
    ArrayList<FContact> contacts = this.getContacts();
    for (int i=0; i<contacts.size(); i++) { //loop through the list
       FContact fc = contacts.get(i);
       if (fc.contains("spike")) {
         this.lives--;
         println(this.lives);
       }
    }
  }
  
}
