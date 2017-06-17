//
//  MKLMusicListViewController.m
//  iMusic
//
//  Created by Mark Lewis on 17-6-16.
//  Copyright (c) 2017年 MarkLewis. All rights reserved.
//

#import "MKLMusicListViewController.h"
#import "SettingCell.h"
#import "SettingGroup.h"
#import "SettingArrowItem.h"
#import "MJMoviePlayerViewController.h"
@interface MKLMusicListViewController () <MJMoviePlayerViewControllerDelegate>
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation MKLMusicListViewController

- (NSMutableArray *)data
{
    if(_data == nil)
    {
        _data = [NSMutableArray array];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSDirectoryEnumerator *dirEnumerator = [fileManager enumeratorAtPath:[[NSBundle mainBundle] resourcePath]];
        
        for (NSString *filePath in dirEnumerator)
        {
            if([filePath.pathExtension isEqualToString:@"mp3"] ||
               [filePath.pathExtension isEqualToString:@"mp4"] ||
               [filePath.pathExtension isEqualToString:@"m4v"] ||
               [filePath.pathExtension isEqualToString:@"mov"] )
            {
                MKLog(@"%@", filePath);
                
                [self.data addObject:filePath];
            }
        }
    }
    
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
    self.title = @"媒体文件";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * const cellIdentifier = @"musicListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    // Configure the cell...
    cell.textLabel.text = self.data[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    // 跳转播放控制器
    NSString *fileName = self.data[indexPath.row];
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
    MJMoviePlayerViewController *moviePlayer = [[MJMoviePlayerViewController alloc] init];
    moviePlayer.delegate = self;
    moviePlayer.movieURL = fileURL;
    
    [self presentViewController:moviePlayer animated:YES completion:nil];
}

#pragma mark - Delegate
- (void)moviePlayerDidFinished
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
