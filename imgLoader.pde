import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;

class ImgLoader
{
  
  String IMG_PATH;
  String IMG_DIR = "/800px/";
  String[] imgs;
  PImage img;
  PImage img_res;
  int imgInd = -1;
  
  void getImages()
  {
    File dir = new File(IMG_PATH);
    String[] imgFiles = dir.list();
    Arrays.sort(imgFiles);
    
    if (imgFiles == null) 
    {
      throw new RuntimeException("could not load images");
    } 
    else 
    {
      imgs = new String[imgFiles.length];
      for (int i=0; i<imgFiles.length; i++) 
      {
        imgs[i] = IMG_PATH + imgFiles[i];
      }
    } 
  }
  
  void setImgDir()
  {
    IMG_PATH = dataPath("") + IMG_DIR;
  }

  void next()
  {
      imgInd = (imgInd + 1) % imgs.length;
      img = loadImage(imgs[imgInd]);
      if (img == null) throw new RuntimeException("could not load image ");
  }

  void prev()
  {
      imgInd = imgInd - 1;
      if (imgInd < 0) imgInd = imgs.length -1;
      img = loadImage(imgs[imgInd]);
      if (img == null) throw new RuntimeException("could not load image ");
  }

  void resetImg()
  {
    try
    {
       img = loadImage(imgs[imgInd-1]);
    }
    catch (Exception e)
    {
      img = loadImage(imgs[imgInd]);
    }
  }
  
  void invertImg()
  {
    img.filter(INVERT);
  }
  
  void desaturateImg()
  {
    img.filter(GRAY);
  }
  
  void blur()
  {
    img.filter(BLUR, 3);
  }
  
  void bitmap()
  {
    img.filter(THRESHOLD);
  }
  
  void posterize()
  {
    img.filter(POSTERIZE, 2);
  }
  
  void erode()
  {
    img.filter(ERODE);
  }
  
  void dilate()
  {
    img.filter(DILATE);
  }
}


