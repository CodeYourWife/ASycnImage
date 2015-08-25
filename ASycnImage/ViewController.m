//
//  ViewController.m
//  ASycnImage
//
//  Created by jianghai on 15/8/19.
//  Copyright © 2015年 YourFather. All rights reserved.
//

#import "ViewController.h"
#import "ImageCell.h"

@interface ViewController()<UITableViewDataSource>
@property (strong,nonatomic)NSArray* urlArray;
@end

@implementation ViewController
@synthesize urlArray = _urlArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.urlArray = @[
                      @"http://www.doubean.com/face/store/face/0000000010/make.jpg",
                      @"http://www.doubean.com/face/store/face/0000000011/make.jpg",
                      @"http://www.doubean.com/face/store/face/0000000012/make.jpg",
                      @"http://www.doubean.com/face/store/face/0000000013/make.jpg",
                      @"http://www.doubean.com/face/store/face/0000000014/make.jpg",
                      @"http://www.doubean.com/face/store/face/0000000015/make.jpg",
                      @"http://www.doubean.com/face/store/face/0000000016/make.jpg",
                      @"http://www.doubean.com/face/store/face/0000000017/make.jpg"
                      ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 500;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.urlArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* identy = @"myImageCell";
    UINib *nib = [UINib nibWithNibName:@"ImageCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:identy];
    
    ImageCell* pCell = [tableView dequeueReusableCellWithIdentifier:identy];
    if(!pCell)
        pCell = [[[NSBundle mainBundle] loadNibNamed:@"ImageCell" owner:self options:nil] lastObject];
    
    pCell.ImageUrl = [self.urlArray objectAtIndex:[indexPath row]];
    
    return pCell;
}



@end
