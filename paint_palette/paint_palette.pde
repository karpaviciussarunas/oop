Input input;

Canvas canvas;
Canvas palette;

Color currentColor;

// how fast canvas can move
int moveSpeed = 1;

void setup(){  
  
  size(700,500);
  input = new Input();
  
  // create new canvas at the center of the window
  canvas = new Canvas(width/2 - 150,height/2 - 150,width/2+150,height/2 + 150,10,10);
  palette= new Canvas(0,0,100,height,4,20);
  
  
  // calculate optimal color difference to get most diverse colors possible
  int offsetX = 255/(palette.sizeX-1);
  int offsetY = 255/(palette.sizeY-1);
  
  // fill palette with colors based on pixel coordinates
  for(int y = 0;y < palette.sizeY;y++){
    for(int x = 0;x < palette.sizeX;x++){
      palette.setPixel(x,y,new Color(y * offsetY,x * offsetX,128)); 
    }
  }

  // add specific colors at specific color squares
  palette.setPixel(0,0,new Color());
  palette.setPixel(1,0,new Color(255,255,255));
  
  // set current color to the first color
  currentColor = palette.getPixel(0,0);
}


void draw(){  
  background(200);
  
  if(input.getKeys('=')){
    // increase canvas size two times
    canvas.setSize(canvas.w * 2,canvas.h * 2);
  }
  
  if(input.getKeys(CONTROL,'x')){
    canvas.clear();
  }
  
  if(input.getKeys(SHIFT)){
    moveSpeed = 5;
  }else{
    moveSpeed = 1; 
  }
  
  if(input.getKeys(LEFT)){
    canvas.posX-=moveSpeed;
  }
  if(input.getKeys(RIGHT)){
    canvas.posX+=moveSpeed;
  }
  if(input.getKeys(UP)){
    canvas.posY-=moveSpeed;
  }
  if(input.getKeys(DOWN)){
    canvas.posY+=moveSpeed;
  }
   
   
  if(mousePressed){
     
    if(mouseX < 100){
      // if mouse is on the left then comunicate with color palette
      int[] pos = palette.screnToGrid(mouseX,mouseY);
      currentColor = palette.getPixel(pos[0],pos[1]);    
    }else{
      // if mouse is on the right then comunicate with canvas
      int[] pos = canvas.screnToGrid(mouseX,mouseY);   
      canvas.setPixel(pos[0],pos[1],currentColor);
      
    }
  }
  
  // after input processing draw results
  canvas.render();
  palette.render();
}

void keyPressed(){
  if(key == CODED){
    // if keys are special characters like ENTER,CONTROL,ALT
    input.setKey(keyCode,true);
  }else{
    // if keys are normal chararacters like a,1,$
    input.setKey(key,true);
  }
}

void keyReleased(){
  if(key == CODED){
    input.setKey(keyCode,false);
  }else{
    input.setKey(key,false);
  }
}
