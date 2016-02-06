//---------------------------------------------------------------------------

// This software is Copyright (c) 2013 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <fmx.h>
#include <cmath>
#pragma hdrstop

#include "ImageRotationU.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TImageRotationForm *ImageRotationForm;

double FLastAngle;

// ---------------------------------------------------------------------------
__fastcall TImageRotationForm::TImageRotationForm(TComponent* Owner)
	: TForm(Owner) {
}

// ---------------------------------------------------------------------------
void __fastcall TImageRotationForm::FormGesture(TObject *Sender,
	const TGestureEventInfo &EventInfo, bool &Handled) {
	if (EventInfo.GestureID == igiRotate) {
		IControl * LObj = this->ObjectAtPoint(ClientToScreen(EventInfo.Location));
		if (static_cast<TImage*>((TImage*)LObj)) {
			// rotate the image
			TImage * LImage = dynamic_cast<TImage*>(LObj->GetObject());
           if (EventInfo.Flags.Contains(TInteractiveGestureFlag::gfBegin)) {
		   		FLastAngle = LImage->RotationAngle;
			} else if (EventInfo.Angle != 0) {
				LImage->RotationAngle = FLastAngle - (EventInfo.Angle * 180) / M_PI;
			}
		}
	}
}
// ---------------------------------------------------------------------------

