//
//  DetailViewController.m
//  secondProject
//
//  Created by Luiz on 5/13/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import "DetailViewController.h"
@interface DetailViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *secondScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *secondImageView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.secondScrollView.delegate = self;
    [self setupScrollView];
}

-(void)setupScrollView {
    self.secondScrollView.maximumZoomScale = 2;
    self.secondScrollView.minimumZoomScale = .5;
    self.secondScrollView.zoomScale = 1.0;


}

-(void)setupImageView {
    //    self.secondImageView.image = [UIImage imageNamed:@"Lighthouse-in-Field"];
    //    [self.secondScrollView addSubview: self.secondImageView];
    //     self.secondImageView.translatesAutoresizingMaskIntoConstraints = NO;
    //    [self.secondImageView.topAnchor constraintEqualToAnchor:self.secondScrollView.topAnchor].active = YES;
    //    [self.secondImageView.widthAnchor constraintEqualToAnchor:self.secondScrollView.widthAnchor].active = YES;
    //    [self.secondImageView.bottomAnchor constraintEqualToAnchor:self.secondScrollView.bottomAnchor].active = YES;

}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.secondImageView;
}
//
//- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
//    return self.secondImageView;
//}
@end
