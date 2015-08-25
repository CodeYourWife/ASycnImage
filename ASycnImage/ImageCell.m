//
//  ImageCell.m
//  ASycnImage
//
//  Created by jianghai on 15/8/19.
//  Copyright © 2015年 YourFather. All rights reserved.
//

#import "ImageCell.h"

@interface ImageCell()<NSURLConnectionDataDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (assign,nonatomic)long long fileLength;
@property (strong,nonatomic)NSMutableData *data;
@end
@implementation ImageCell
@synthesize imageView = _imageView;
@synthesize data = _data;

-(nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
    }
    return self;
}

- (void)awakeFromNib {
    
    self.data = [NSMutableData dataWithCapacity:0];
    self.imageView.image = [UIImage imageNamed:@"default.jpg"];
    
    [self loadImage:self.ImageUrl];
}

- (void)loadImage:(NSString*)url
{
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest* req = [NSURLRequest requestWithURL:URL];
    
    NSURLConnection *con = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    [con start];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _fileLength = response.expectedContentLength;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
    if(self.data.length == self.fileLength)
        [self updateImageView];
        
}
- (void)updateImageView
{
    UIImage *image = [UIImage imageWithData:self.data];
    self.imageView.image = image;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
