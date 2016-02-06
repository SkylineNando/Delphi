//---------------------------------------------------------------------------

#ifndef ipFunctionsH
#define ipFunctionsH
//---------------------------------------------------------------------------
#include <Dialogs.hpp>
#include <math.h>


bool loadImage(const AnsiString filename, Graphics::TBitmap *bitmap);
void convertToGrayScale(TImage *image);
void sobel(TImage *image);
void negative(TImage *image);
void averageFilter(TImage *image);
void medianFilter(TImage *image);
void flipH(TImage *image);
void flipV(TImage *image);
void stretchHistogram(TImage *image);
void sobel2(TImage *image);
void addImages(TImage *ImgA, TImage *ImgB, TImage *Result);
void subtractImages(TImage *ImgA, TImage *ImgB, TImage *Result);
void averageImages(TImage *ImgA, TImage *ImgB, TImage *Result);
void oldPicture(TImage *Image);
void linearTransformation(TImage *image, Byte **auximage, float a,  int b);

#endif

