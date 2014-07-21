  void keyReleased() {
        switch(key) {
            case 'm':
                imgLoader.next();
                break;
            case 'n':
                imgLoader.prev();
                break;
            case '+':
                increaseSize();
                break;
            case '-':
                decreaseSize();
                break;
            case 'r':
                isRecording = !isRecording;
                break;
            case 'p' :
                saveFrame("../imgs/output####.png");
                break;
            case 'c' :
                moveCircular = !moveCircular;
                break;
            case 'v' :
                direction = (direction == 1) ? -1 : 1;
                break;
            case 'y' :
                velocity += 0.0125;
                if (velocity > MAX_VEL) velocity = MAX_VEL;
                break;
            case 'x' :
                velocity -= 0.0125;
                if (velocity < MIN_VEL) velocity = MIN_VEL;
                break;
            case 'i' :
                showImage = !showImage;
                break;
            case '1' :
                imgLoader.resetImg();
                break;
            case '2' :
                imgLoader.invertImg();
                break;
            case '3' :
                imgLoader.desaturateImg();
                break;
            case '4' :
                imgLoader.blur();
                break;
            case '5' :
                imgLoader.bitmap();
                break;
            case '6' :
                imgLoader.posterize();
                break;
            case '7' :
                imgLoader.erode();
                break;
            case '8' :
                imgLoader.dilate();
                break;
            default:
                break;
        }
        switch(keyCode) 
        {
      case UP :  
        jumpY = (int) size;
        jumpVertical = true;
        break;
      case DOWN :  
        jumpY = (int) -size;
        jumpVertical = true;
        break;
      case LEFT :  
        jumpX = (int) -size;
        jumpHorizontal = true;
        break;
      case RIGHT :  
        jumpX = (int) size;
        jumpHorizontal = true;
        break;
            default:
                break;
      }
    }
    
  void increaseSize()
  {
    size *= 2;
  }
  
  void decreaseSize()
  {
    size /= 2;
  }
      
  public void mouseMoved() 
  {
    posX = mouseX;
    posY = mouseY;

    jumpX = 0;
    jumpY = 0;
  }
