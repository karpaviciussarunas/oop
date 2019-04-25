class Color{ 
  int r;
  int g;
  int b; 

  Color(){
    
  }
  
  Color(int r,int g,int b){
    set(r,g,b);
  }

  void set(int r, int g,int b){
    this.r = r;
    this.g = g;
    this.b = b;
  }
  
  void set(Color other){
    set(other.r,other.g,other.b);
  }
}
