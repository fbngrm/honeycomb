void drawColumns()
  {
    for (int ix=0; ix<=ceil(width/rowStep); ix++)
    {
      pushMatrix();
      translate(ix*rowStep,-(ix%2)*(colStep*0.5f));
      drawColumn();
      popMatrix();
    }
  }
  
  void drawColumn()
  {
    pushMatrix();
    for (int iy=0; iy<=ceil(height/colStep); iy++)
    {
        drawCell();
        translate(0, colStep);
    }
    popMatrix();
  }

  void drawCell()
  {
    firstPoint = new PVector(
          (CENTER_TRIANGLE.x + size * cos(ANGLE)),
          (CENTER_TRIANGLE.y + size * sin(ANGLE)));
      
    for (int j=6; j>0; j--) 
    {
        PVector secondPoint = new PVector(
            (CENTER_TRIANGLE.x + size * cos(ANGLE*j)),
            (CENTER_TRIANGLE.y + size * sin(ANGLE*j)));
        
        beginShape();
        scale(-1, 1);
        texture(imgLoader.img);
        vertex(CENTER_TRIANGLE.x, CENTER_TRIANGLE.y, posX, posY);
        vertex(firstPoint.x, firstPoint.y, posX+(size),posY+(size));
        vertex(secondPoint.x, secondPoint.y, posX-(size),posY+(size));
        endShape();
        
        firstPoint = secondPoint;
      }
  }
    
  void moveCircular()
  {
    circAngle  = (circAngle + direction * ((TWO_PI / framerate) * velocity)) % TWO_PI;
    PVector newPostition = new PVector(
          (circleCenter.x + size * cos(circAngle)),
          (circleCenter.y + size * sin(circAngle)));
    posX = newPostition.x;
    posY = newPostition.y;
  }
