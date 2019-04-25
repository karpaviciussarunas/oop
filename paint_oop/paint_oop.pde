Input input;
Canvas canvas;


void setup(){  
  size(700,500);
  // initialize objects (construct them)
  input = new Input();
  canvas = new Canvas(50,50,300,300,10,10);
  
  // setting individual pixels
  canvas.setPixel(2,2,new Color(255,0,0));
}

void draw(){  
  background(200);
  
  if(input.getKeys(CONTROL,'x')){
    println("implement delete");
  }
  
  if(mousePressed){
    // transform screen mouse coordinates to canvas pixels
    // as we need to return x and y at the same time, we use array {x,y}
    int[] pos = canvas.screnToGrid(mouseX,mouseY);
    
    // draw on canvas using transformed coordinates
    canvas.setPixel(pos[0],pos[1],new Color(0,255,0));
  }
  
  // after input processing draw results
  canvas.render();
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
