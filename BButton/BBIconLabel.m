//
//  BBIconLabel.m
//  BButtonDemo
//
//  Created by Thomas on 08.06.13.
//  Copyright (c) 2013 Hexed Bits. All rights reserved.
//

#import "BBIconLabel.h"

//NSString* BButton_iconFontName = @"icomoon";
NSString* BBIconLabel_iconFontName = @"FontAwesome";
NSDictionary* BBIconLabel_textToIconsMap = nil;

@implementation BBIconLabel

+ (void) setTextToIconMap:(NSDictionary*)map
{
    BBIconLabel_textToIconsMap = map;    
}

+ (void) setIconFontName:(NSString*)fontName // changes the icon font for BButton globally
{
    BBIconLabel_iconFontName = fontName;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setText:self.text];
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    [self adjustFont];
}

- (void) adjustFont // resize every time the label changes itself
{
    int h = self.frame.size.height - 2;
    if (self.frame.size.height < 0) // frame is not ready in -awakeFromNib
        h = self.font.pointSize;
    
    UIFont* f = [UIFont fontWithName:BBIconLabel_iconFontName size:self.frame.size.height];
    
#ifdef DEBUG
    if (f == nil)
    {
        NSLog(@"BButton Font '%@' not found!",BBIconLabel_iconFontName);
    }
#endif
    
    self.font = f;
}

- (void)setText:(NSString *)text
{
    if(BBIconLabel_textToIconsMap)
    {
        NSString* s = [BBIconLabel_textToIconsMap objectForKey:text];
        if(s != nil)
        {
            [super setText:s];
            [self adjustFont];
            return;
        }
    }
    
    [super setText:text];
}

@end
