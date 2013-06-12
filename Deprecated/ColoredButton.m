//
//  ColoredButton.m
//  LocandyApp
//
//  Created by Thomas on 12.12.12.
//  Copyright (c) 2012 Locandy. All rights reserved.
//

#import "ColoredButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation ColoredButton

/*- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //NSLog("%i",self.backgroundColor[0]);
        
    }
    return self;
}*/

-(void)awakeFromNib
{
    [super awakeFromNib];
        
    if(self.borderRadius == 0)
        self.borderRadius = 8;
        
    if(_highlightColor == nil)
        self.highlightColor = [UIColor colorWithRed:21.0/255 green:120.0/255 blue:234.0/255 alpha:1.0];
        
}

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(73, 44);
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
    return [super beginTrackingWithTouch:touch withEvent:event];
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
    return [super endTrackingWithTouch:touch withEvent:event];
}

- (void)drawRect:(CGRect)rect
{
	// draw a box with rounded corners to fill the view -
	CGRect boxRect = self.bounds;
    
    if(self.frame.size.height < 30)
    {
        NSLog(@"Warning button height must be set by constraint. Default height of UIButton (44px) does not work.");
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
	boxRect = CGRectInset(boxRect, 3.0, 3.0);
    
    float radius = self.borderRadius;

    CGContextBeginPath(context);

    // fill
    if(self.highlighted)
    {
        CGContextSetFillColorWithColor(context, [self.highlightColor CGColor]);
    }
    else
    {
        CGContextSetFillColorWithColor(context, [self.buttonColor CGColor]);
	}
        
    CGContextMoveToPoint(context, CGRectGetMinX(boxRect) + radius, CGRectGetMinY(boxRect));
    CGContextAddArc(context, CGRectGetMaxX(boxRect) - radius, CGRectGetMinY(boxRect) + radius, radius, 3 * M_PI / 2, 0, 0);
    CGContextAddArc(context, CGRectGetMaxX(boxRect) - radius, CGRectGetMaxY(boxRect) - radius, radius, 0, M_PI / 2, 0);
    CGContextAddArc(context, CGRectGetMinX(boxRect) + radius, CGRectGetMaxY(boxRect) - radius, radius, M_PI / 2, M_PI, 0);
    CGContextAddArc(context, CGRectGetMinX(boxRect) + radius, CGRectGetMinY(boxRect) + radius, radius, M_PI, 3 * M_PI / 2, 0);
	
    CGContextClosePath(context);
    CGPathRef p = CGContextCopyPath(context);


    // stroke shadow
    CGContextSetLineWidth(context, 1.0);
    CGContextTranslateCTM(context, 1.0, 1.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextStrokePath(context);
    CGContextTranslateCTM(context, -2, -2);

    CGContextAddPath(context, p);
    CGContextFillPath(context);

    // stroke
    CGContextSetLineWidth(context, 1.0);
    CGContextAddPath(context, p);
    CGContextSetStrokeColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
    CGContextStrokePath(context);
        
    //[super drawRect:rect];
}

@end
