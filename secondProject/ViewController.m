//
//  ViewController.m
//  ScrollView Image Galleries
//
//  Created by Luiz on 5/13/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (nonatomic, strong) NSMutableArray<UIImageView*> *imageViewsArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //  self.myScrollView.delegate = self;
    self.imageViewsArray = [NSMutableArray array];
    [self setupMyScrollView];


}
//- (IBAction)tap:(UITapGestureRecognizer *)sender {
//
//    [self performSegueWithIdentifier:@"segueSecondView" sender:nil];
//}

-(void)setupMyScrollView{
    NSArray *imagesName = @[@"Lighthouse-in-Field", @"Lighthouse-night", @"Lighthouse-zoomed"];

    for (int i = 0; i < imagesName.count; i++) {



        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imagesName[i]]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.imageViewsArray addObject: imageView];


        [self.myScrollView addSubview:imageView];
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
    }

    for (int i = 0; i < imagesName.count; i++) {
        [self.imageViewsArray[i].topAnchor constraintEqualToAnchor:self.myScrollView.topAnchor].active = YES;
        [self.imageViewsArray[i].widthAnchor constraintEqualToAnchor:self.myScrollView.widthAnchor].active = YES;
        [self.imageViewsArray[i].bottomAnchor constraintEqualToAnchor:self.myScrollView.bottomAnchor].active = YES;
        //        [self.imageViewsArray[i].centerYAnchor constraintEqualToAnchor:self.myScrollView.centerYAnchor].active = YES;
        //        [self.imageViewsArray[i].heightAnchor constraintLessThanOrEqualToAnchor:self.myScrollView.heightAnchor].active = YES;

        if(i == 0){
            [self.imageViewsArray[i].leftAnchor constraintEqualToAnchor:self.myScrollView.leftAnchor constant:0].active = YES;
        } else {
            [self.imageViewsArray[i].leftAnchor constraintEqualToAnchor:self.imageViewsArray[i - 1].rightAnchor constant: 0].active = YES;
        }

        if (i == imagesName.count - 1) {
            [self.imageViewsArray[i].rightAnchor constraintEqualToAnchor:self.myScrollView.rightAnchor constant:0].active = YES;
        }

    }




}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}

@end
