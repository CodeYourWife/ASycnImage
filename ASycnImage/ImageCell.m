//
//  ImageCell.m
//  ASycnImage
//
//  Created by jianghai on 15/8/19.
//  Copyright © 2015年 YourFather. All rights reserved.
//



#import "ImageCell.h"

@interface RoundImageView : UIImageView

@end

@implementation RoundImageView

//- (void)willMoveToWindow:(UIWindow *)newWindow
//{
    //直接设置
//    CALayer* roundedLayer = self.layer;
//    [roundedLayer setMasksToBounds:YES];
//    roundedLayer.cornerRadius = 32;
//    roundedLayer.borderColor = [[UIColor grayColor] CGColor];
    
    //添加一个遮罩层
//    CAShapeLayer *styleLayer = [CAShapeLayer layer];
//    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 64, 64) byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight) cornerRadii:CGSizeMake(32, 32)];
//    styleLayer.path = shadowPath.CGPath;
//    self.layer.mask = styleLayer;
//}
-(void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    [[UIColor whiteColor] set];
    UIRectFill(bounds);
    
    [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 64, 64) cornerRadius:32] addClip];
    
    [self.image drawInRect:bounds];
}
@end


@interface ImageCell()<NSURLConnectionDataDelegate>
@property (weak, nonatomic) IBOutlet RoundImageView *imageView;
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
}

- (void)loadImage:(NSString*)url
{
    
    self.imageView.image = [UIImage imageNamed:@"AY_48.png"];
    self.imageView.contentMode = UIViewContentModeRedraw;
    
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest* req = [NSURLRequest requestWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    
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
//    UIImage *image = [UIImage imageWithData:self.data];
    UIImage* image = [UIImage imageNamed:@"AY_48.png"];
    self.imageView.image = image;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
