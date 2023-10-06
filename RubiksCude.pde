import peasy.*;

PeasyCam cam; 
int dim = 3;
Cubie[] cube = new Cubie[dim*dim*dim];
String [] allMoves = {"f", "b", "u", "d","l","r"};
String sequence = "";
int counter = 0;
boolean started = false;

Move move;
void setup()
{
    fullScreen(P3D);
    cam = new PeasyCam(this, 400);
    int index = 0;
    for(int x = -1; x <= 1; x++)
    {
        for(int y = -1; y <= 1; y++)
        {
            for(int z = -1; z <= 1; z++)
            {
                PMatrix3D matrix = new PMatrix3D();
                matrix.translate(x,y,z);
                cube[index] =  new Cubie(matrix,x,y,z);
                index++;
            }   
        }
    }
    //cube[0].c = color(255,0,0);
    //cube[2].c = color(0,0,255);
    for(int i = 0; i < 200; i++)
    {
      int r = int(random(allMoves.length));
      if(random(1) < 0.5)
      {
        sequence += allMoves[r];         
      } else
      {
        sequence += allMoves[r].toUpperCase();                 
      }
    }
    for(int i = sequence.length() - 1; i >= 0; i--){
      String nextMove = flipCase(sequence.charAt(i));
      sequence += nextMove;
    }
    move = new Move();
}
String flipCase(char c){
  String s = "" + c;
  if(s.equals(s.toLowerCase())){
    return s.toUpperCase();
  }
  else{
    return s.toLowerCase();
  }
}  
int index = 0;


void draw()
{
  background(51);
  if(started){
    if(frameCount % 1 == 0){
      if(counter < sequence.length()){
        char move = sequence.charAt(counter);
        applyMove(move);
        counter++;
      }
    }
  }
  scale(55);
    for(int i = 0; i < cube.length; i++)
    {
      cube[i].show();
    }   
}