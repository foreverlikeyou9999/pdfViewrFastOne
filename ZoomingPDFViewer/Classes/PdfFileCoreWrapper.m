//
//  PdfFileCoreWrapper.m
//  ZoomingPDFViewer
//
//  Created by andrew batutin on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PdfFileCoreWrapper.h"

@implementation PdfFileCoreWrapper
@synthesize pdfRef;

-(void)dealloc
{
	CGPDFDocumentRelease(pdfRef);
	[super dealloc];
}

-(id)initWithCGPDFDocumentRef:(CGPDFDocumentRef)pdf
{
    if ((self = [super init])) 
	{
		pdfRef = pdf;
	}
    return self;
}

// Create a new CGPDFDocumentRef by file name
+(PdfFileCoreWrapper*)createCGPDFDocumentRefByFileName:(NSString*)bookName
{
	// Open the PDF document
	NSURL *pdfURL = [[NSBundle mainBundle] URLForResource:bookName withExtension:nil];
	CGPDFDocumentRef pdf = CGPDFDocumentCreateWithURL((CFURLRef)pdfURL);
	
	// create a wrapper
	PdfFileCoreWrapper* pdfBook = [[[PdfFileCoreWrapper alloc] initWithCGPDFDocumentRef:pdf] autorelease];
	
	return pdfBook;
}

@end
