
//---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "tabhost.h"
#include "dockform.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

//---------------------------------------------------------------------------
__fastcall TTabDockHost::TTabDockHost(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TTabDockHost::PageControl1DockOver(TObject *Sender,
      TDragDockObject *Source, int X, int Y, TDragState State,
      bool &Accept)
{
  Accept = dynamic_cast<TDockableForm*>(Source->Control) != NULL;
}
//---------------------------------------------------------------------------

void __fastcall TTabDockHost::PageControl1GetSiteInfo(TObject *Sender,
      TControl *DockClient, TRect &InfluenceRect, TPoint &MousePos,
      bool &CanDock)
{
  CanDock = dynamic_cast<TDockableForm*>(DockClient) != NULL;
}
//---------------------------------------------------------------------------

void __fastcall TTabDockHost::PageControl1UnDock(TObject *Sender,
      TControl *Client, TWinControl *NewTarget, bool &Allow)
{
  // Only 2 dock clients means the host must be destroyed and
  // the remaining window undocked to its old position and size.
  if ((PageControl1->DockClientCount == 2) && (NewTarget != PageControl1))
	  PostMessage(this->Handle, WM_CLOSE, 0, 0);
}
//---------------------------------------------------------------------------

void __fastcall TTabDockHost::FormClose(TObject *Sender,
      TCloseAction &Action)
{
  if (PageControl1->DockClientCount == 1)
  {
    TControl* DockClient = PageControl1->DockClients[0];

    Types::TPoint TopLeft = DockClient->ClientToScreen(Point(0, 0));
    Types::TPoint BottomRight = DockClient->ClientToScreen(Point(UndockWidth, UndockHeight));

    Types::TRect r(TopLeft, BottomRight);
    DockClient->ManualFloat(r);

    Action = caFree;
  }
  else
    Action = caHide;
}
//---------------------------------------------------------------------------

