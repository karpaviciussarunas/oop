int vr;
int hr;
//int s = 800;
int x = 0;
int brush = 10;
int lastx;
int lasty;
int gridSizeX;
int gridSizeY;
int gridColor;
int cellSize = 50;
int grid[][];

int i = 0;
int X = 600;
int Y = 400;


//piesiama lentele
void drawGrid(){
  stroke(200);
  strokeWeight(1);

 for(int i = 0;i < height; i+= 10){
 line(0,i,height,i);
 line(i,0,i,height);
}
for(int i = 0;i < width; i+= 10){
 line(i,0,i,width);
 line(0,i,width,i);
} 
strokeWeight(1);
}

void setup(){
//  frameRate(5);
  size(600,400); 
  background(255,255,255);
  stroke(200);
  drawGrid();
  gridSizeX = width/cellSize;
  gridSizeY = height/cellSize;
  grid = new int[gridSizeX][gridSizeY];
  for(int i =0;i < gridSizeX; i++){
   for(int j = 0; j < gridSizeY; j++){
   //  for(int k = 0; k< gridColor; k++){
     grid[i][j] = 255; 
//     print(grid[i][j]);
 //    }
   }
  }
}

void draw(){
/*  if (vr < 500){
 line(0,vr,width,vr);
 line(hr,0,hr,width);
 vr=vr+60;
 hr=hr+60;
}*/
for(int i = 0;i <gridSizeX; i++){
  for(int j = 0;j < gridSizeY; j++){
  //  for(int k = 0; k< gridColor; k++){
    fill(grid[i][j]);
    rect(i*cellSize,j*cellSize,cellSize,cellSize);
//    }
  }
}

if(keyPressed && key =='a'){
  gridColor = 100;
  }else if(keyPressed && key =='b'){
  gridColor = 150;
  }else if(keyPressed && key =='c'){
  gridColor = 255;
    drawGrid();
  }
  
   if(mousePressed && (0 <= mouseX) && (X >= mouseX) && (0 <= mouseY) && (Y >= mouseY)){
//    point(mouseX,mouseY);
     int mouseGridX = mouseX/cellSize;
     int mouseGridY = mouseY/cellSize;
   //  int mouseColor = grid[mouseGridX][mouseGridY];
     grid[mouseGridX][mouseGridY]= 30;

   } 
/*     lastx = mouseX;
     lasty = mouseY;
*/

}
 void keyPressed(){
if(key=='s'||key=='S'){
saveFrame("nx-####.png"); 
}
strokeWeight(1);
}
