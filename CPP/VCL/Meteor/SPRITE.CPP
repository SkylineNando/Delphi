//--------------------------------------------------------------------------
// Copyright (c) 1995-2010 Embarcadero Technologies, Inc.
//--------------------------------------------------------------------------
#include <typeinfo.h>
#include "sprite.h"

// values used to initialize meteors.  these values are randomly
// tweaked, so each meteor looks different
//
int  angle1[10] = { 0,45,90,135,180,225,270,315,0,0 };
int  radius1[10] = { 30,30,30,30,30,30,30,30,0,0 };
int  count1 = 8;

// adjust - value to convert degrees to radians
//
//  pi can be computed as atan(1)*4,
//
//  and there are 2*pi radians in 360 degrees so:
//
//  adjust = 2*pi/360 = pi/180 = atan(1)*4/180 = atan(1)/45
//

const double adjust = atan(1)/45;

double sinTable[360];
double cosTable[360];

double sind( int angle ) {
  return sinTable[(angle+360)%360];
}
double cosd( int angle ) {
  return cosTable[(angle+360)%360];
}

void InitSinCosTables() {
  int i;
  for (i=0;i<360;i++) {
	sinTable[i] = sin(adjust*i);
	cosTable[i] = cos(adjust*i);
  }
}

#pragma startup InitSinCosTables

void SpriteList::Add( Sprite* sprite ) {
  count++;
  if (root==0) {
	root = sprite;
	sprite->next = 0;
	sprite->owner = this;
	return;
  }
  sprite->next = root;
  sprite->owner = this;
  root = sprite;
}

void SpriteList::DrawAll( TCanvas *Canvas ) {
  Sprite *temp = root;
  while (temp!=0)
  {
	temp->Draw( Canvas );
	temp=temp->next;
  }
}

int SpriteList::UpdateAll() {
  Sprite *previous,
		 *current = root;
  int    points = 0;

  previous = 0;
  while (current!=0) {
  // if the object is not condemned, call it's update
  // function
	if (!(current->condemned)) {
	  points+=current->Update();
	  previous = current;
	  current=current->next;
	}
  // if the object is condemned, delete it from the
  // list
	else {
	  // special case if we're deleting the root node
	  if (previous==0) {
		root = current->next;
		delete current;
		count--;
		current = root;
	  }
	  else {
		previous->next = current->next;
		delete current;
		count--;
		current = previous->next;
	  }
	}
  }
  return points;
}



Sprite* SpriteList::CheckForHitMeteor( TPoint& p ) {
  Sprite *temp = root;
  while (temp!=0)
  {
	if ((typeid(*temp) == typeid(Meteor)) &&
		(temp->boundingRect.Contains( p )))
		return temp;
	temp=temp->next;
  }
  return 0;
}

Meteor::Meteor( TPoint aOrigin, TLSize aMomentum, int aSize, int aSpawnCount ):
  Sprite( TLSize( 600,400 ) ) {
  origin = aOrigin;
  mx = aMomentum.cx;
  my = aMomentum.cy;
  size = aSize;
  spawnCount = aSpawnCount;
  for (int i=0;i<10;i++) {
	angle[i] = (angle1[i]+random(20)-10)%360;
	radius[i] = (radius1[i]+random(10)-5)/(4-size);
  }
  angularMomentum = random(7)-4;
  currentAngle = 0;
  count = count1;
}

void Meteor::Hit() {
  size--;
  if (size>0) {
	for (int i=0;i<spawnCount;i++)
	  owner->Add( new Meteor( origin, TLSize( random(10)-5, random(10)-5 ),
							  size, size ) );
  }
  condemned=true;
}


void Meteor::Draw( TCanvas *Canvs ) {
  TPoint temp;
  TPoint points[10];
  int i;


  temp = TPoint( radius[0]*sind(angle[0]+currentAngle),
				radius[0]*cosd(angle[0]+currentAngle) );
  ResetBoundingRect();
  temp = TPoint(temp.x+origin.x,temp.y+origin.y );
  ExpandBoundingRect( temp);
  points[0]= temp;
//  dc.MoveTo( origin+temp );
  for (i=1;i<=count;i++) {
	temp = TPoint( radius[i%count]*sind(angle[i%count]+currentAngle),
				   radius[i%count]*cosd(angle[i%count]+currentAngle) );
	temp = TPoint(temp.x+origin.x,temp.y+origin.y );
	ExpandBoundingRect( temp );
	points[i] = temp;
//    dc.LineTo( origin+temp );
  }
  points[count]=points[0];
  Canvs->Polyline( points, count);
}

int Shot::Update() {
  // shots die after a fixed amount of time

  if (timeToDie > 0)
  {
	origin = TPoint(origin.x+mx,origin.y+my);
	timeToDie--;
	if (timeToDie==0) condemned = true;
  }

  Wrap();  // if the shot is off the screen, wrap to other side

  // check against all meteors in the list, to see if any are
  // colliding with ourself

  Sprite* meteor = owner->CheckForHitMeteor( origin );

  // if so, tell the meteor it was hit, and mark ourself for
  // deletion

  if (meteor) {
    ((Meteor*)meteor)->Hit();
    condemned = true;
	int size = ((Meteor*)meteor)->GetSize();
    switch (size) {
      case 0:
        return 500;
      case 1:
        return 50;
      case 2:
		return 5;
	}
  }
  return 0;
}



SprMessage::SprMessage( TPoint aOrigin, int aBufferLen ):
  Sprite( TLSize(600,400) ) {
  text = new char[ aBufferLen ];
  bufferLen = aBufferLen;
  origin = aOrigin;
}

void SprMessage::Draw( TCanvas *Canvs ) {
  const int tw = 6;          // text width
  const int th = 10;         // text height
  TPoint temp = origin;
  int i;

  for (i=0;i<strlen(text);i++) {
	switch (text[i]) {
	  case '0':
		Canvs->MoveTo(temp.x,temp.y);
		Canvs->LineTo(temp.x+tw,temp.y);
		Canvs->LineTo(temp.x+tw,temp.y+th);
		Canvs->LineTo(temp.x,temp.y+th);
		Canvs->LineTo(temp.x,temp.y);
		break;
	  case '1':
		Canvs->MoveTo(temp.x+(tw/2),temp.y);
		Canvs->LineTo(temp.x+(tw/2),temp.y+th+1);
		break;
	  case '2':
		Canvs->MoveTo(temp.x,temp.y);
		Canvs->LineTo(temp.x+tw,temp.y);
		Canvs->LineTo(temp.x+tw,temp.y+(th/2));
		Canvs->LineTo(temp.x,temp.y+(th/2));
		Canvs->LineTo(temp.x,temp.y+th);
		Canvs->LineTo(temp.x+tw+1,temp.y+th);
		break;
	  case '3':
		Canvs->MoveTo(temp.x,temp.y);
		Canvs->LineTo(temp.x+tw,temp.y);
		Canvs->LineTo(temp.x+tw,temp.y+th);
		Canvs->LineTo(temp.x-1,temp.y+th);
		Canvs->MoveTo(temp.x+tw,temp.y+(th/2));
		Canvs->LineTo(temp.x-1,temp.y+(th/2));
		break;
	  case '4':
		Canvs->MoveTo(temp.x,temp.y);
		Canvs->LineTo(temp.x,temp.y+(th/2));
		Canvs->LineTo(temp.x+tw,temp.y+(th/2));
		Canvs->MoveTo(temp.x+tw,temp.y);
		Canvs->LineTo(temp.x+tw,temp.y+(th+1));
		break;
	  case '5':
		Canvs->MoveTo(temp.x+tw,temp.y);
		Canvs->LineTo(temp.x,temp.y);
		Canvs->LineTo(temp.x,temp.y+(th/2));
		Canvs->LineTo(temp.x+tw,temp.y+(th/2));
		Canvs->LineTo(temp.x+tw,temp.y+(th));
		Canvs->LineTo(temp.x-1,temp.y+(th));
		break;
	  case '6':
		Canvs->MoveTo(temp.x+tw,temp.y);
		Canvs->LineTo(temp.x,temp.y);
		Canvs->LineTo(temp.x,temp.y+th);
		Canvs->LineTo(temp.x+tw,temp.y+th);
		Canvs->LineTo(temp.x+tw,temp.y+(th/2));
		Canvs->LineTo(temp.x-1,temp.y+(th/2));
		break;
	  case '7':
		Canvs->MoveTo(temp.x,temp.y);
		Canvs->LineTo(temp.x+tw,temp.y);
		Canvs->LineTo(temp.x+tw,temp.y+(th+1));
		break;
	  case '8':
		Canvs->MoveTo(temp.x,temp.y);
		Canvs->LineTo(temp.x+tw,temp.y);
		Canvs->LineTo(temp.x+tw,temp.y+th);
		Canvs->LineTo(temp.x,temp.y+th);
		Canvs->LineTo(temp.x,temp.y);
		Canvs->MoveTo(temp.x,temp.y+(th/2));
		Canvs->LineTo(temp.x+tw,temp.y+(th/2));
		break;
	  case '9':
		Canvs->MoveTo(temp.x,temp.y+th);
		Canvs->LineTo(temp.x+tw,temp.y+th);
		Canvs->LineTo(temp.x+tw,temp.y);
		Canvs->LineTo(temp.x,temp.y);
		Canvs->LineTo(temp.x,temp.y+(th/2));
		Canvs->LineTo(temp.x+tw,temp.y+(th/2));
		break;
	  case '*':  // ship
		Canvs->MoveTo(temp.x+(tw/2),temp.y);
		Canvs->LineTo(temp.x+tw,temp.y+th);
		Canvs->LineTo(temp.x+(tw/2),temp.y+(th-(th/4)));
		Canvs->LineTo(temp.x,temp.y+th);
		Canvs->LineTo(temp.x+(tw/2),temp.y);
		break;
	}
	temp.x += tw+tw/2;
  }
}

SprMessage::~SprMessage() {
	delete [] text;
}


