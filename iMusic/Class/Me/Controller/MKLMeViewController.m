//
//  MKLMeViewController.m
//  iMusic
//
//  Created by Mark Lewis on 17-5-1.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import "MKLMeViewController.h"
#import "RETableViewManager.h"
#import "WBSubtitleItem.h"
#define SectionHeaderHeight 12
#define SectionFooterHeight 0.5

@interface MKLMeViewController ()<RETableViewManagerDelegate>
@property (nonatomic, strong) RETableViewManager *manager;
@property (nonatomic, assign) CGFloat groupSpace;
@end

@implementation MKLMeViewController

#pragma mark - init 设置分组模式
- (id)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    // 创建RETableViewManager管理类
    self.manager = [[RETableViewManager alloc]initWithTableView:self.tableView delegate:self];
    
    // 设置tableview边框
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 6, 0);
    
    // 设置分割线
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [self setupOtherInfo];
}


- (void)setupOtherInfo
{
    // 注册cell
    self.manager[@"WBSubtitleItem"] = @"WBSubtitleCell";
    
    // 设置第三组
    RETableViewSection *section = [RETableViewSection section];
    [self.manager addSection:section];
    section.headerHeight = SectionHeaderHeight;
    section.footerHeight = SectionFooterHeight;
    
    // 设置item
    WBSubtitleItem *hotWeibo = [WBSubtitleItem itemWithTitle:@"热门微博" subtitle:@"笑话，娱乐都搬到这里来啦" imageName:@"hot_status"];
    hotWeibo.subtitleAlignment = NSTextAlignmentRight;
    WBSubtitleItem *findpeople = [WBSubtitleItem itemWithTitle:@"找人" subtitle:@"名人，专家，有趣的人尽在这里" imageName:@"find_people"];
    findpeople.subtitleAlignment = NSTextAlignmentRight;
    [section addItemsFromArray:@[hotWeibo,findpeople]];
    
    // 设置第四组
    section = [RETableViewSection section];
    [self.manager addSection:section];
    section.headerHeight = SectionHeaderHeight;
    section.footerHeight = SectionFooterHeight;
    
    // 设置item
    WBSubtitleItem *gameCenter = [WBSubtitleItem itemWithTitle:@"游戏中心" imageName:@"game_center"];
    // 发现身边的有缘人，有趣事
    WBSubtitleItem *near = [WBSubtitleItem itemWithTitle:@"周边" subtitle:@"发现身边" imageName:@"near"];
    //near.accessoryType
    near.subtitleAlignment = NSTextAlignmentRight;
    near.subtitleFont = [UIFont systemFontOfSize:14];
    [section addItemsFromArray:@[gameCenter,near]];
}





/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
