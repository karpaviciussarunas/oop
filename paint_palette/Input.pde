class Input{
  
  // hold key presses in array
  boolean[] keyArray; 
  
  Input(){
    keyArray = new boolean[255];
  } 
  
  void setKey(int keyCode,boolean isPressed){
    if(keyCode < 0 || keyCode >= 255)return; //<>//
      

    keyArray[keyCode] = isPressed;   

  }
  
  boolean getKey(int keyCode){
    if(keyCode < 0 || keyCode >= 255)return false;
    
    return keyArray[keyCode];
  }
  
  // int... syntax lets to pass any number of arguments
  // it's just an array int[], first arguments is int[0], etc.
  boolean getKeys(int... keyCode){ 
    for(int i = 0;i < keyCode.length;i++){
      if(getKey(keyCode[i]) == false)return false;
    }   
    return true;
  }
}
