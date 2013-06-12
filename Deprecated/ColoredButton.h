//
//  ColoredButton.h
//  LocandyApp
//
//  Created by Thomas on 12.12.12.
//  Copyright (c) 2012 Locandy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColoredButton : UIButton
{
}

@property CGFloat borderRadius;
    // set this custom property with IB's "User defined runtime properties" tab.

@property (strong) UIColor* buttonColor;
    // set this custom property with IB's "User defined runtime properties" tab.

@property (strong) UIColor* highlightColor;
    // default=standard touchdown blue; set this custom property with IB's "User defined runtime properties" tab.

@end
