//
//  firstController.m
//  secondProject
//
//  Created by Luiz on 5/13/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import "firstController.h"
#import "DetailViewController.h"

@interface firstController ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (nonatomic, strong) NSMutableArray<UIImageView*> *imageViewsArray;
@property (nonatomic, strong) NSString * passedImage;

@property (weak, nonatomic) IBOutlet   UIPageControl* pageControl;
@property (nonatomic, strong) UITapGestureRecognizer * tap;



@end

@implementation firstController

- (void)viewDidLoad {
    [super viewDidLoad];
    //  self.myScrollView.delegate = self;
    self.imageViewsArray = [NSMutableArray array];
    [self setupTapGestureRecognizer];
    [self setupMyScrollView];

    [self setupPageControl];

}
//- (IBAction)tap:(UITapGestureRecognizer *)sender {
//
//    [self performSegueWithIdentifier:@"segueSecondView" sender:nil];
//}
-(void) setupTapGestureRecognizer {


   // self.tap.delegate = self;
//    [self.myScrollView addGestureRecognizer: self.tap];

//    [self.myScrollView addGestureRecognizer: self.tap];

    NSLog(@"tape found - %@", self.tap);

}

-(void)setupMyScrollView{
    NSArray *imagesName = @[@"Lighthouse-in-Field", @"Lighthouse-night", @"Lighthouse-zoomed"];

    for (int i = 0; i < imagesName.count; i++) {

//        UIView * v = [[UIView alloc] initWithFrame: CGRectZero];


        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imagesName[i]]];

        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.imageViewsArray addObject: imageView];


        [self.myScrollView addSubview:imageView];
        imageView.userInteractionEnabled = YES;


         UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goDetailView:)];

        [imageView addGestureRecognizer: tap];

        imageView.translatesAutoresizingMaskIntoConstraints = NO;
    }

    for (int i = 0; i < imagesName.count; i++) {
        [self.imageViewsArray[i].topAnchor constraintEqualToAnchor:self.myScrollView.topAnchor].active = YES;
        [self.imageViewsArray[i].widthAnchor constraintEqualToAnchor:self.myScrollView.widthAnchor ].active = YES;
        [self.imageViewsArray[i].bottomAnchor constraintEqualToAnchor:self.myScrollView.bottomAnchor].active = YES;


        if(i == 0){
            [self.imageViewsArray[i].leftAnchor constraintEqualToAnchor:self.myScrollView.leftAnchor constant:0].active = YES;
        } else {
            [self.imageViewsArray[i].leftAnchor constraintEqualToAnchor:self.imageViewsArray[i - 1].rightAnchor constant: 0].active = YES;
        }

        if (i == imagesName.count - 1) {
            [self.imageViewsArray[i].rightAnchor constraintEqualToAnchor:self.myScrollView.rightAnchor constant:0].active = YES;
        }

    }

    self.myScrollView.delegate = self;

}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//    for (UIImageView *image in scrollView.subviews) {
//        image.image. = self.view.center;
//    }
}



- (void) goDetailView:(UITapGestureRecognizer *)sender {
    NSLog(@"tap is working");


    [self performSegueWithIdentifier: @"showDetail" sender: nil];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pageWidth = self.myScrollView.frame.size.width;
    float fractionalPage = self.myScrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.pageControl.currentPage = page;
}

-(void) setupPageControl {
    self.pageControl.numberOfPages = self.imageViewsArray.count;
    self.pageControl.currentPage = 0;
    self.pageControl.tintColor = [UIColor redColor];
    self.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor greenColor];

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString: @"showDetail"]) {
        DetailViewController * detailView =  segue.destinationViewController;
        detailView.passedImage = [UIImage imageNamed: @""];
    }
}



@end
