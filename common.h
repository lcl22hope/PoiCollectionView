//
//  utility.h
//  RewriteCollectionView
//
//  Created by lcl on 15/12/10.
//  Copyright © 2015年 lcl. All rights reserved.
//

#ifndef utility_h
#define utility_h


#ifndef MAS_SHORTHAND
#define MAS_SHORTHAND
#endif

#define SCREEN_WIDTH  ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_BOUNDS ([[UIScreen mainScreen] bounds])

#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define LSCOLOR_RGB(r,g,b)    [UIColor colorWithRed: (r)/255.0f green: (g)/255.0f blue: (b)/255.0f alpha: 1.0]
#define LSCOLOR_RGBA(r,g,b,a) [UIColor colorWithRed: (r)/255.0f green: (g)/255.0f blue: (b)/255.0f alpha: (a)]
#define LSCOLOR_HEX(hexColor) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f \
                                              green: (((hexColor >>  8) & 0xFF))/255.0f \
                                               blue: ((hexColor & 0xFF))/255.0f alpha:1.0]


#endif /* utility_h */
