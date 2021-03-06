//
//  ZYRootMenuItem.h
//  ZYMobReader
//
//  Created by barfoo2 on 13-9-10.
//  Copyright (c) 2013年 ZYProSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYRootMenuItemModel.h"

typedef void (^RootMenuItemTapAction) (void);
@interface ZYRootMenuItem : UIControl
{
    BFImageView *backImgView;
    BFImageView *iconImgView;
    UILabel     *titleLabel;
    
    RootMenuItemTapAction _tapAction;
}
@property (nonatomic,retain)NSIndexPath *indexPath;

- (id)initWithMenuItemModel:(ZYMenuItemModel*)menuItem withFrame:(CGRect)frame;
- (void)setContentModel:(ZYMenuItemModel*)menuItem;
- (void)setTapOnItemAction:(RootMenuItemTapAction)tapAction;

@end
