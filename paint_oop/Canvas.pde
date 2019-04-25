class Canvas{
  // canvas position
  int posX;
  int posY; 
  // canvas size
  int w;
  int h; 
  // pixel size
  int cellSizeX;
  int cellSizeY; 
  // pixels count
  int sizeX;
  int sizeY;
  
  Color[][] grid;
   
  Canvas(int x1,int y1,int x2,int y2,int sizeX,int sizeY){
    
    posX = x1;
    posY = y1;
    
    w = x2-x1;
    h = y2-y1;
    
    cellSizeX = w/sizeX;
    cellSizeY = h/sizeY;  
    
    this.sizeX = sizeX;
    this.sizeY = sizeY;  
    
    grid = new Color[sizeX][sizeY];
    
    // as color array holds objects we must construct each element
    for(int y = 0;y < sizeY;y++){
      for(int x = 0;x < sizeX;x++){
        grid[x][y] = new Color(255,255,255);
      }
    }
  }
  
  void render(){
    for(int y = 0;y < sizeY;y++){
      for(int x = 0;x < sizeX;x++){
        Color c = grid[x][y];
        fill(c.r,c.g,c.b);
        rect(posX + x*cellSizeX,posY + y*cellSizeY,cellSizeX,cellSizeY);
      }
    }
  }
  
  void setPixel(int x,int y,Color col){
    // leave method if incorrect arguments are fed
    if(x < 0 || x >= sizeX)return;
    if(y < 0 || y >= sizeY)return;
    
    grid[x][y] = col;
  }
  
  int[] screnToGrid(int x,int y){
    // methods can return only one result
    // to return multile values return arrays
    int[] result = new int[2];
    
    result[0] = (x-posX)/cellSizeX;
    result[1] = (y-posY)/cellSizeY;
    
    return result;
  } 
}
