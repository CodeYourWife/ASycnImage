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
                      @"http://pic74.nipic.com/file/20150812/10570451_125051067000_2.jpg",
                      @"http://pic74.nipic.com/file/20150803/19780287_133254170000_2.jpg",
                      @"http://pic72.nipic.com/file/20150714/20189787_173803509000_2.jpg",
                      @"http://f1.topitme.com/1/76/77/1135354797d3f77761o.jpg",
                      @"http://f10.topitme.com/o/201102/09/12972145895656.jpg",
                      @"http://f10.topitme.com/o/201007/29/12803354165011.jpg",
                      @"http://pic.nipic.com/2008-05-07/20085722191339_2.jpg",
                      @"http://fb.topitme.com/b/8b/4f/11978218352664f8bbo.jpg"
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
    else
        pCell.imageView.image = nil;
    
    [pCell loadImage:[self.urlArray objectAtIndex:[indexPath row]]];
    
    return pCell;
}


@end
