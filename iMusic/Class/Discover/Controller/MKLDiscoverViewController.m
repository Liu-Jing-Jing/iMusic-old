//
//  MKLDiscoverViewController.m
//  iMusic
//
//  Created by Mark Lewis on 17-6-8.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import "MKLDiscoverViewController.h"
#import "MKLProductListController.h"
#import "MKLSearchBar.h"
#import "SettingGroup.h"
#import "SettingArrowItem.h"
#import "KDDisplayHTMLViewController.h"
#import "SettingCell.h"
#import "MKLMainNavigationController.h"
#import "MKLMusicListViewController.h"
#import "JTSDemoViewController.h"
@interface MKLDiscoverViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation MKLDiscoverViewController

- (NSMutableArray *)data
{
    if(_data == nil) _data = [NSMutableArray array];
    
    return _data;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    MKLSearchBar *searchBar = [MKLSearchBar searchBar];
    searchBar.delegate = self;
    // 尺寸
    searchBar.frame = CGRectMake(0, 0, 300, 30);
    // 设置中间的标题内容
    self.navigationItem.titleView = searchBar;
    
    [self setupGroupData];
}

- (void)setupGroupData
{
    // 第一组
    SettingItem *bookList = [SettingArrowItem itemWithIcon:nil title:@"Awesome-iOS" destVcClass:[KDDisplayHTMLViewController class]];
    
    SettingItem *productList = [SettingArrowItem itemWithIcon:nil title:@"Product List" destVcClass:[MKLProductListController class]];
    
    
    SettingItem *jtsImageViewerDemo = [SettingArrowItem itemWithIcon:nil title:@"JTS ImageViewer Demo" destVcClass:[JTSDemoViewController class]];
    SettingGroup *group0 = [[SettingGroup alloc]init];
    //group0.header = @"推送和提醒";
    //group0.footer = @"推送和提醒";
    group0.items = @[bookList, productList, jtsImageViewerDemo];
    
    
    // 第一组
    SettingItem *musicList = [SettingArrowItem itemWithIcon:nil title:@"我的音乐" destVcClass:[MKLMusicListViewController class]];
    SettingGroup *group1 = [[SettingGroup alloc]init];
    group1.items = @[musicList];
    
    [self.data addObject:group0];
    [self.data addObject:group1];

}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    SettingGroup *group = self.data[section];
    return group.items.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettingCell *cell = [SettingCell cellWithTableView:tableView];
    // 设置cell数据
    SettingGroup *group = self.data[indexPath.section];
    SettingItem *item = group.items[indexPath.row];
    cell.item = item;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SettingGroup *group = self.data[indexPath.section];
    SettingItem *item = group.items[indexPath.row];
    
    // 点击cell运行代码
    if (item.option)
    {
        item.option();
    }
    
    if ([item isKindOfClass:[SettingArrowItem class]])
    {
        SettingArrowItem *arrItem =(SettingArrowItem *) item;
        if (arrItem.destVcClass == nil)
        {
            return;
        }
        UIViewController *vc = [[arrItem.destVcClass alloc]init];
        vc.title = arrItem.title;
        
        if([item.title isEqualToString:@"Awesome-iOS"])
        {
            [self presentViewController:vc animated:YES completion:nil];
        }
        else
        {
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:nil];
        }
    }
//    MKLProductListController *productListVC = [[MKLProductListController alloc] init];
//    [self.navigationController pushViewController:productListVC animated:YES];
}


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
