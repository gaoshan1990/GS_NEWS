//
//  Config.h
//  GS_NEWS
//
//  Created by most on 16/11/18.
//  Copyright © 2016年 most. All rights reserved.
//

#ifndef Config_h
#define Config_h

#define KSCREENWIDTH      [UIScreen mainScreen].bounds.size.width
#define KSCREENHEIGHT     [UIScreen mainScreen].bounds.size.height

#ifdef DEBUG
#define  GSLog(...)  NSLog(__VA_ARGS__)
#else
#define  NSLog(...)
#endif /* Config_h */
