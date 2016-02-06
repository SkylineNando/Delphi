//--------------------------------------------------------------------------
// Copyright (c) 1995-2010 Embarcadero Technologies, Inc.
//--------------------------------------------------------------------------
#ifndef SPRITEH
#define SPRITEH


#include <vcl.h>
#include <math.h>

const int MAX_SPEED = 20;

//extern double sinTable[360];
//extern double cosTable[360];

double sind( int angle );
double cosd( int angle );



struct TLSize : public SIZE
{
    TLSize() { cx = cy = 0; }
    TLSize(int _cx, int _cy) { cx=_cx; cy=_cy; }
    TLSize(const SIZE& pt)
    {
      cx = pt.cx;
      cy = pt.cy;
    }
    bool operator ==(const TLSize& pt) const
    {
      return (cx == pt.cx) && (cy == pt.cy);
    }
    bool operator !=(const TLSize& pt) const
    {
      return !(pt == *this);
    }
};



class SpriteList;  // forward declaration for use in Sprite class

// class Sprite -- a base class for any object which will be displayed
// on the screen.
//
class Sprite {
  friend class SpriteList;   // so the SpriteList class can access
                             // data members
protected:
  SpriteList *owner;         // pointer to the list which contains us
  Sprite     *next;          // pointer to next sprite in the list
  TPoint     origin;         // sprites position in the window
  TRect      boundingRect;   // a rectangle which completely encloses sprite
  double     mx,my;          // current direction of sprite
  TLSize     screenSize;     // size of screen which contains the sprite
                             // used to wrap objects from one side of screen to other
  bool       condemned;      // used to mark dead objects
private:
  Sprite() {}                // to generate compile-time error

public:
  Sprite( TLSize aScreenSize )
  {
    screenSize = aScreenSize;
    ResetBoundingRect();
    mx=my=0;
    condemned = false;
  }
  void SetMomentum( TLSize& newMomentum )
  {
    mx = newMomentum.cx;
    my = newMomentum.cy;
  }

  void Condemn()
  {
    condemned = true;
  }
  // Update -- by default, moves sprite based on it's momentum.  Should
  // return a value which will be added to the score
  //
  virtual int Update()
  {
    origin.x+=mx;
    origin.y+=my;
    Wrap();
    return 0;
  }
  void ResetBoundingRect()
  {
    boundingRect = TRect( origin, origin );
  }

  // ExpandBoundingRect -- given a point, expand our bounding rectangle
  // to include this point.
  //
  void ExpandBoundingRect( TPoint p ) {
    if (p.x<boundingRect.left)
      boundingRect.left = p.x;
    if (p.y<boundingRect.top)
      boundingRect.top = p.y;
    if (p.x>boundingRect.right)
      boundingRect.right = p.x;
    if (p.y>boundingRect.bottom)
      boundingRect.bottom = p.y;
    //boundingRect.Normalize();
  }

  // Default draw function draws a pixel at the sprites origin
  //
  virtual void Draw( TCanvas *Canvs ) {
    Canvs->Pixels[origin.x][origin.y] = TColor(RGB(255, 255, 255));
  }


  // Wrap -- adjust the sprites origin, if it strays off the edge of
  // the window
  //
  void Wrap() {
    origin.x = (origin.x + screenSize.cx) % screenSize.cx;
    origin.y = (origin.y + screenSize.cy) % screenSize.cy;
  }
};

// SpriteList -- contains a list of sprites.  Contains specific
// functions for collision detection
//
class SpriteList {
  Sprite *root;
public:
  int count;
  SpriteList() {
    root = 0;
    count = 0;
  }
  void Add( Sprite* sprite );
//  bool Remove( Sprite* sprite );
  void DrawAll( TCanvas * Canvs );
  int UpdateAll();
  Sprite* CheckForHitMeteor( TPoint& p );
};

// Meteor -- a rock, floating in space.  The meteor is specified as
// a series of polor-coordinate points (an angle and a radius).  This
// allows for faster calculation when making the meteors rotate as
// they float about.
//

// the following are defined in sprite.cpp

extern int angle1[10];
extern int radius1[10];
extern int count1;



class Meteor: public Sprite {
  int    angularMomentum,    // how fast the meteor is spinning
         currentAngle;       // current angle of rotation
  int    angle[10],          // angle and radius of the points
         radius[10];         //   which define the meteor
  int    count;              // # of points which define the meteor
  int    size;               // 1=tiny, 2=medium, 3=large rock
  int    spawnCount;         // how many smaller meteors to create when hit

public:
  Meteor( TPoint aOrigin, TLSize aMomentum, int aSize, int aSpawnCount );
  int GetSize() { return size; }
//  void SetRotationAngle( int angle );
  int Update() {
    origin.x+=mx;
    origin.y+=my;
    Wrap();
    currentAngle = (currentAngle+angularMomentum+360)%360;
    return 0;
  };
  void Hit();
  virtual void Draw( TCanvas *Canvs );
};

// Shot -- a bullet little block as it is easier to draw...
class Shot: public Sprite {
  int timeToDie;            // shots disappear after a set amount of time
public:
  Shot( TPoint aOrigin, TLSize aMomentum, int aTimeToDie ): Sprite(TLSize(600,400))
   {  //*BBK*
    origin = aOrigin;
    mx = aMomentum.cx;
    my = aMomentum.cy;
    timeToDie = aTimeToDie;
  }
  virtual void Draw( TCanvas *Canvs )
  {
    if (timeToDie > 0)
    {
      Canvs->Pen->Color =  clWhite;
      Canvs->Rectangle(origin.x-1, origin.y-1, origin.x+1, origin.y+1);
      Canvs->Pen->Color =  clGreen;
    }
  }
  virtual int Update();
};

// Debris -- a spinning line.  it floats about for a few seconds and
// disappears.  the player ship is turned into these when it is destroyed.
//
class Debris: public Sprite {
  TPoint p1,p2;
  int size;              // length of line
  int angle;             // current angle of spinning line
  int angularMomentum;   // rate of spin
  int timeToDie;
public:
  Debris( TPoint& aP1, TPoint& aP2, TLSize& screenSize ): Sprite(screenSize)
  {
//    origin = TPoint( (p1.x+p2.x)/2, (p1.y+p2.y)/2 );
    p1 = aP1;
    p2 = aP2;
    mx = random(10)-5;
    my = random(10)-5;
    angularMomentum = random(10)-5;
    timeToDie = 20 + random(5);
  }
  virtual int Update()
  {
    if (timeToDie>0)
    {
      p1.x += mx;
      p1.y += my;
      p2.x += mx;
      p2.y += my;
      timeToDie--;
    } else
      Condemn();
    return 0;
  }
  void Draw( TCanvas * Canvs )
  {
    Canvs->MoveTo(p1.x,p1.y);
    Canvs->LineTo(p2.x,p2.y);
  }
};

// Ship -- the player ship
//
class Ship: public Sprite {
  int angle,radius,thrust;
public:
  Ship( TPoint pos ):
  Sprite( TLSize(600,400) ) { //*BBK*
    origin = pos;
    angle  = 0;
    radius = 10;
    thrust = 0;
    mx = my = 0;
  }
  virtual void Draw( TCanvas *Canvs )
  {
    TPoint p1,p2,p3,p4;

    p1 = TPoint( radius*sind(angle), radius*cosd(angle) );
    p2 = TPoint( radius*sind(angle+130), radius*cosd(angle+130) );
    p3 = TPoint( (radius/4)*sind(angle+180), (radius/4)*cosd(angle+180) );
    p4 = TPoint( radius*sind(angle+230), radius*cosd(angle+230) );
    Canvs->MoveTo( p1.x+origin.x , p1.y+origin.y );
    Canvs->LineTo( p2.x+origin.x , p2.y+origin.y );
    Canvs->LineTo( p3.x+origin.x , p3.y+origin.y );
    Canvs->LineTo( p4.x+origin.x , p4.y+origin.y );
    Canvs->LineTo( p1.x+origin.x , p1.y+origin.y );
  }
  void Explode() {
    Condemn();
    TPoint p1,p2,p3,p4;
    p1.x = origin.x + radius*sind(angle);
    p1.y = origin.y + radius*cosd(angle);

    p2.x = origin.x + radius*sind(angle+130);
    p2.y = origin.y + radius*cosd(angle+130) ;

    p3.x = origin.x + (radius/4)*sind(angle+180);
    p3.y = origin.y + (radius/4)*cosd(angle+180);

    p4.x = origin.x + radius*sind(angle+230);
    p4.y = origin.y + radius*cosd(angle+230);

    owner->Add( new Debris( p1, p2, screenSize ) );
    owner->Add( new Debris( p2, p3, screenSize ) );
    owner->Add( new Debris( p3, p4, screenSize ) );
    owner->Add( new Debris( p4, p1, screenSize ) );
  }
  void Rotate( int adjust )
  {
    angle = (angle+adjust+360)%360;
  }
  void AddThrust( int adjust )
  {
    thrust+=adjust;
    if (thrust<0) thrust=0;
  }
  virtual int Update() {
    int len;
    mx+= thrust*sind( angle );
    my+= thrust*cosd( angle );
    len = (sqrt(mx*mx+my*my));
    if (len>MAX_SPEED) {
      mx = mx/len*MAX_SPEED;
      my = my/len*MAX_SPEED;
      thrust=0;
    }
    origin.x+=mx;
    origin.y+=my;
    Wrap();

    // check to see if we hit a meteor

    Sprite* meteor = owner->CheckForHitMeteor( origin );

    if (meteor)
      return -9999;

    return 0;
  }
  Shot* CreateNewShot() {
    TLSize shotDir = TLSize( 10*sind(angle) + mx,10*cosd(angle) +my);
    TPoint shotOrigin = TPoint(origin.x + (radius*sind( angle )), origin.y + (radius*cosd( angle )) );
    return new Shot( shotOrigin,shotDir, 20 );
  }
};

// Message -- a sprite that can display numbers 0-9, used for score display
//
class SprMessage: public Sprite {
  char *text;
  int  bufferLen;
public:
  SprMessage( TPoint aOrigin, int aBufferLen );
  ~SprMessage();
  void SetText( const char *aText ) {
    strncpy( text, aText, bufferLen );
  }
  virtual void Draw( TCanvas *Canvs );
};

#endif // SPRITE_H
