
  // enable debug mode
  boolean DEBUG = false;
  // dimensions
  int WIDTH = 650;
  int HEIGHT = 500;
  float size = 75;
  // angle of the triangles
  float ANGLE = TWO_PI/6;
  // origin of a honeycomb
  PVector CENTER_TRIANGLE = new PVector(0,0);
  // min and max velocity of the circular movement
  float MIN_VEL = 0.0125;
  float MAX_VEL = 2;
  // initial velocity
  float velocity = 0.0125f;
  // framerate of the sketch
  int framerate = 30;
  // angle for the circular movement
  float circAngle = 0;
  // center of the circular movement
  PVector circleCenter;
  // steps for the tesselation
  float cellSize = sqrt(3) * (size/2);
  float colStep = 2 * cellSize;
  float rowStep = 1.5f * size - 1;
  int step = 0;
  // enable mouse
  boolean mouseMode = true;
  // reference point for the texture & honeycomb calculation
  float posX = 0;
  float posY = 0;
  // pixels to jump on key stroke
  int jumpX = 0;
  int jumpY = 0;
  // flag to enable jumping
  boolean jumpVertical = false;
  boolean jumpHorizontal = false;
  // enable recording
  boolean isRecording = false;
  // auto movement
  boolean moveCircular = false;
  // direction of the auto mvement
  int direction = 1;
  // handle the image loading
  ImgLoader imgLoader = new ImgLoader();
  // show the image path
  boolean showImage = false;
  // coordinates for the honeycomb calculation
  PVector firstPoint;  
  
  void setup() 
  {
    size(WIDTH, HEIGHT, P3D);
    frameRate(framerate);
    
    try 
    {
      imgLoader.setImgDir();
      imgLoader.getImages();
      imgLoader.next();
    }
    catch(RuntimeException e)
    {
      println(e);
    }
    
    if (frame != null) frame.setResizable(true);
  }
  
  void draw() 
  {
    noStroke();
    // automatic movement
    if (moveCircular) 
    {
      circleCenter = new PVector(mouseX+jumpX, mouseY+jumpY);
      moveCircular();
    }
    // jump positions
    else if(jumpHorizontal)
    {
      posX += jumpX;
      jumpHorizontal = false;
    }
    else if(jumpVertical)
    {
      posY += jumpY;
      jumpVertical = false;
    }
    
    // tesselation steps
    cellSize = sqrt(3) * (size/2);
    colStep = 2 * cellSize;
    rowStep = 1.5f * size - 1;
    
    // tesselate
    drawColumns();
    
    // show the image path
    if (showImage) 
    {
      textSize(20);
      fill(0, 0, 0);
      text("IMG: " + imgLoader.imgs[imgLoader.imgInd], 50, 50);
      fill(255, 0, 0);
      text("IMG: " + imgLoader.imgs[imgLoader.imgInd], 50, 75);
      fill(255, 255, 255);
      text("IMG: " + imgLoader.imgs[imgLoader.imgInd], 50, 100);
    }
    
    // record
    if (isRecording) saveFrame("../frames/frame####.png");
  }


  

