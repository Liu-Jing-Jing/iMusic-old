//
//  WBStatusCell.m
//  iMusic
//
//  Created by Mark Lewis on 17-6-23.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import "WBStatusCell.h"
#import "WBStatus.h"
#import "WBUserModel.h"
#import "WBStatusFrame.h"
#import "UIImageView+WebCache.h"
#import "WBStatusToolbar.h"
#import "WBStatusTopView.h"
@interface WBStatusCell()
/** 顶部的view */
@property (nonatomic, weak) WBStatusTopView *topView;

/** 微博的工具条 */
@property (nonatomic, weak) WBStatusToolbar *statusToolbar;
@end


@implementation WBStatusCell

#pragma mark - 初始化工厂方法
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"statusCell";
    WBStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[WBStatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code
        // 1.添加原创微博内部的子控件
        [self setupOriginalSubviews];
        // 2.添加微博的工具条
        [self setupStatusToolBar];
    }
    return self;
}

/**
 *  添加原创微博内部的子控件
 */
- (void)setupOriginalSubviews
{
    
    // 0.设置cell选中时的背景
    self.selectedBackgroundView = [[UIView alloc] init];
    self.backgroundColor = [UIColor clearColor]; //默认有白色的一圈在Cell周围
    /** 1.顶部的view */
    WBStatusTopView *topView = [[WBStatusTopView alloc] init];
    [self.contentView addSubview:topView];
    self.topView = topView;
}

/**
 *  添加微博的工具条
 */
- (void)setupStatusToolBar
{
    /** 1.微博的工具条 */
//    UIImageView *statusToolbar = [[UIImageView alloc] init];
//    statusToolbar.image = [self stretchableImageWithNamed:@"timeline_card_bottom_background"];
//    statusToolbar.highlightedImage = [self stretchableImageWithNamed:@"timeline_card_bottom_background_highlighted"];
//    [self.contentView addSubview:statusToolbar];
//    self.statusToolbar = statusToolbar;
    WBStatusToolbar *statusToolbar = [[WBStatusToolbar alloc] init];
    [self.contentView addSubview:statusToolbar];
    self.statusToolbar = statusToolbar;
}



/**
 *  拦截frame的设置
 */
- (void)setFrame:(CGRect)frame
{
    frame.origin.y += WBStatusTableBorder;
    frame.origin.x = WBStatusTableBorder;
    frame.size.width -= 2 * WBStatusTableBorder;
    frame.size.height -= WBStatusTableBorder;
    [super setFrame:frame];
}

#pragma mark - 设置Frame和数据
/**
 *  传递模型数据
 */
- (void)setStatusFrame:(WBStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    // 1.原创微博
    [self setupOriginalData];

    // 2.微博工具条
    [self setupStatusToolbarData];
}


/**
 *  原创微博数据的传递
 */
- (void)setupOriginalData
{
    // 1.topView
    self.topView.frame = self.statusFrame.topViewF;
    
    // 2.传递模型数据
    self.topView.statusFrame = self.statusFrame;
}

/**
 *  设置微博工具条的数据
 */
- (void)setupStatusToolbarData
{
    self.statusToolbar.frame = self.statusFrame.statusToolbarF;
    self.statusToolbar.status = self.statusFrame.status;
}


#pragma mark - init
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
