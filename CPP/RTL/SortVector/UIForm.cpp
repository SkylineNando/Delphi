//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UIForm.h"
#include "Unit2.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
	generate_numbers(numbers);
	//auto keyword determines type in this case a  std::vector<T>::forward_iterator
	for (auto i = numbers.begin(); i != numbers.end(); ++i)
		ListBox1->Items->Add(*i);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject *Sender)
{
	sort_vector(numbers);
	//ranged for loop determines size of collection and data type
	for(auto i : numbers)
		 ListBox2->Items->Add(i);

}
//---------------------------------------------------------------------------


