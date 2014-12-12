//
//  ViewController.m
//  BButtonDemo
//
//  Created by Jesse Squires on 4/2/13.
//  Copyright (c) 2013 Hexed Bits. All rights reserved.
//
//  http://hexedbits.com
//

#import "ViewController.h"
#import "IcomoonFontIcons.h"
#import "BBIconLabel.h"

@interface ViewController ()

- (NSString *)titleForType:(BButtonType)type;

@end

@implementation ViewController

+ (void)initialize
{
    // Text to Icon converter for UILabels of type BBIconLabels (FULL TEXT MATCH REQUIRED)
    // Use map here and the rest you can do in InterfaceBuilder without coding
    // we need to use +initialize to have the dict ready when the XIB is loaded.
    [BBIconLabel setTextToIconMap:
        [NSDictionary dictionaryWithObjectsAndKeys:
            FAIconTwitter, @"#Icon1",
         nil]];
}

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self demoFontAwesome];
    // MUST PROVIDE YOUR OWN TTF FILE! [self demoIcomoon];
}

- (void)demoIcomoon
{
#ifdef DEBUG
    BButton_listFonts();
#endif
    
    [BButton setIconFontName:@"icomoon"];
    
    // this is the "thin-space" fix for an incompatible very wide whitespace %20 char in icomoon.
    [BButton setSpacerStringBeforeIcon:@"\u2004\u2004" andAfterIcon:@"\u2009"]; // try also \u2003, \u2004, ... \u2009
    
    BButtonType type = 0;
    
    int range = IcomoonIcon_MAX_ICON_UNICHAR - IcomoonIcon_MIN_ICON_UNICHAR;
    for(int i = 0; i < 2; i++) {
        
        for(int j = 0; j < 7; j++) {
            CGRect frame = CGRectMake(32.0f + (i * 144.0f), 20.0f + (j * 60.0f), 112.0f, 40.0f);
            BButton *btn = [[BButton alloc] initWithFrame:frame];
            [btn setType:type];
            [btn setTitle:[self titleForType:type] forState:UIControlStateNormal];
            
            if(type == BButtonTypeFacebook)
                [btn addIcon:IcomoonIcon_Lock beforeTitle:YES];
            else if(type == BButtonTypeTwitter)
                [btn addIcon:IcomoonIcon_Login beforeTitle:NO];
            
            type++;
            if(type > BButtonTypeGray) {
                unichar c = IcomoonIcon_MIN_ICON_UNICHAR + arc4random() % range;
                NSString *iconString = [NSString stringWithCharacters:&c length:1];
                
                btn = [[BButton alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 40.0f, 40.0f)];
                [btn setType:(type % 2) ? BButtonTypeInverse : BButtonTypeDefault];
                [btn setTitle:iconString withFontSize:20.0];
            }
            
            [self.view addSubview:btn];
        }
    }
}

- (void)demoFontAwesome
{
    // there is no longer a built-in mapping of integers to icons, so we need this for the demo
    // use the appropriate header files with #define macros.
    NSArray* awesomeStrings = [NSArray arrayWithObjects:@"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", nil];

    
    BButtonType type = 0;
    
    for(int i = 0; i < 2; i++) {
        
        for(int j = 0; j < 7; j++) {
            
            // create normal text only buttons
            CGRect frame = CGRectMake(32.0f + (i * 144.0f), 20.0f + (j * 60.0f), 112.0f, 40.0f);
            BButton *btn = [[BButton alloc] initWithFrame:frame];
            [btn setType:type];
            [btn setTitle:[self titleForType:type] forState:UIControlStateNormal]; // UIControl method, default font
            
            if(type == BButtonTypeFacebook)
                [btn addIcon:FAIconFacebook beforeTitle:YES];
            else if(type == BButtonTypeTwitter)
                [btn addIcon:FAIconTwitter beforeTitle:NO];
            
            type++;
            if(type > BButtonTypeGray) {
                btn = [[BButton alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 40.0f, 40.0f)];
                [btn setType:(type % 2) ? BButtonTypeInverse : BButtonTypeDefault];
                [btn setTitle:[awesomeStrings objectAtIndex:arc4random() % 209] withFontSize:20.0];
            }
            
            [self.view addSubview:btn];
        }
    }
}

#pragma mark - Utilities
- (NSString *)titleForType:(BButtonType)type
{
    NSString *title = nil;
    
    switch (type) {
        case BButtonTypePrimary:
            title = @"Primary";
            break;
        case BButtonTypeInfo:
            title = @"Info";
            break;
        case BButtonTypeSuccess:
            title = @"Success";
            break;
        case BButtonTypeWarning:
            title = @"Warning";
            break;
        case BButtonTypeDanger:
            title = @"Danger";
            break;
        case BButtonTypeInverse:
            title = @"Inverse";
            break;
        case BButtonTypeTwitter:
            title = @"Twitter";
            break;
        case BButtonTypeFacebook:
            title = @"Facebook";
            break;
        case BButtonTypePurple:
            title = @"Purple";
            break;
        case BButtonTypeGray:
            title = @"Gray";
            break;
        case BButtonTypeDefault:
        default:
            title = @"Default";
            break;
    }
    
    return title;
}

- (IBAction) radioClicked:sender;
{
    // dummy method to make radio buttons work (requires action sending)
    NSLog(@"BRadioButton %li pressed!",(long)[sender tag]);
}

@end