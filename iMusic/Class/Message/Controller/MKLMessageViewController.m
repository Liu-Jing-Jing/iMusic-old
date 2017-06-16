//
//  MKLMessageViewController.m
//  iMusic
//
//  Created by Mark Lewis on 17-5-1.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import "MKLMessageViewController.h"
#import "SettingCell.h"
#import "SettingGroup.h"
#import "SettingArrowItem.h"
#import "MKLMusicListViewController.h"
@interface MKLMessageViewController ()
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation MKLMessageViewController

- (NSMutableArray *)data
{
    if(_data == nil) _data = [NSMutableArray array];
    
    return _data;
}
#pragma mark - View Lifecycle
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"写私信" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    [self setupGroupData];
}

- (void)setupGroupData
{
    // 第一组
    SettingItem *musicList = [SettingArrowItem itemWithIcon:nil title:@"我的音乐" destVcClass:[MKLMusicListViewController class]];
    SettingGroup *group0 = [[SettingGroup alloc]init];
    group0.items = @[musicList];
    
    [self.data addObject:group0];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
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
        [self.navigationController pushViewController:vc animated:YES];
    }
}

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
