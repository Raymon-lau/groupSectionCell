//
//  RMMYProjectController.m
//  RM
//
//  Created by Raymon on 2018/8/1.
//  Copyright © 2018年 raymon. All rights reserved.
//

#import "RMMyProjectController.h"
#import "RMMYProjectUI.h"
#import "RMMyProjectViewModel.h"
#import "RMMYProjectTopView.h"
#import "RMGroupShadowTableView.h"
#import <MJRefresh/MJRefresh.h>
#import "UIColor+Additions.h"
#import "UILabel+Masonry.h"
#import "UIButton+Masonry.h"


CGFloat const kMyProjectTopViewheight = 150;
@interface RMMYProjectController ()<GADInterstitialDelegate, GADBannerViewDelegate, RMMYProjectUIDelegate>
// tableview1
@property (nonatomic, strong) RMGroupShadowTableView *leftTableView;
// tableview2
@property (nonatomic, strong) RMGroupShadowTableView *rightTableView;
// tableview 视图
@property (nonatomic, strong) RMMYProjectUI *myProjectUI;
// viewmodel
@property (nonatomic, strong) RMMYProjectViewModel *viewModel;
// 顶部视图
@property (nonatomic, strong) RMMYProjectTopView *headerView;
// 标题
@property (nonatomic, strong) UILabel *titleLabel;
// detail模块
@property (nonatomic, strong) UIButton *inLoanButton;
// detail模块
@property (nonatomic, strong) UIButton *hasEndedButton;
// 当前模块标记视图
@property (nonatomic, strong) UIView *lineView;
// detail
@property (nonatomic, strong) UILabel *pendingMoney;
// detail
@property (nonatomic, strong) UILabel *pendingCapital;
// detail
@property (nonatomic, strong) UILabel *pendingInterest;
// detail
@property (nonatomic, strong) UILabel *historyTotalRepayment;
// detail
@property (nonatomic, strong) UILabel *hasCapital;
// detail
@property (nonatomic, strong) UILabel *hasInterest;
@property (nonatomic, strong) GADInterstitial *interstitial;
@property (nonatomic, strong) GADBannerView *adsView;
@end

@implementation RMMYProjectController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的项目";
    self.view.backgroundColor = [UIColor cyanColor];
    [self creatUI];
    [self configADS];
}

- (void)configADS{
    self.adsView.adUnitID = ADHORIZONTALID;
    self.adsView.rootViewController = self;
    GADRequest *request = [GADRequest request];
    [self.adsView loadRequest:request];
    
    self.interstitial = [self createAndLoadInterstitial];
    
    [self.interstitial loadRequest:request];
}

- (GADInterstitial *)createAndLoadInterstitial{
    GADInterstitial *interstitial =
    [[GADInterstitial alloc] initWithAdUnitID:ADPAGEID];
    interstitial.delegate = self;
    [interstitial loadRequest:[GADRequest request]];
    return interstitial;
}
#pragma mark - UI
- (void)creatUI{
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.rightTableView];
    self.rightTableView.hidden = YES;
    //添加监听，动态观察tableview的contentOffset的改变
    [self.leftTableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:@"inloanTable"];
    [self.rightTableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:@"hasEndedTable"];
    [self MyProjectHeaderView];
    if (@available(iOS 11.0, *)) {
        self.leftTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.rightTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)MyProjectHeaderView{
    _headerView = [[RMMYProjectTopView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kMyProjectTopViewheight)];
    _headerView.backgroundColor = [UIColor colorWithHex:@"#6375E6"];
    [self.view addSubview:_headerView];
    
    WEAKSELF
    UIButton *backButton = [UIButton getButtonWithLightFontSize:15 TextColorHex:@"#FFFFFF" backGroundColor:@"" superView:_headerView masonrySet:^(UIButton *view, MASConstraintMaker *make) {
        make.left.offset(16);
        make.top.offset(iPhoneX ? (44) : (24));
        [view setTitle:@"    " forState:UIControlStateNormal];
        [view setImage:[UIImage imageNamed:@"myProject_backArrow"] forState:UIControlStateNormal];
    }];
    
    _titleLabel = [UILabel getLabelWithFontSize:18 textColorHex:@"#FFFFFF" superView:_headerView masonrySet:^(UILabel *view, MASConstraintMaker *make) {
        STRONGSELF
        make.centerY.equalTo(backButton.mas_centerY);
        make.centerX.equalTo(strongSelf.headerView.mas_centerX);
        view.text = @"我的项目";
    }];
    
    // 出借中
    _inLoanButton = [UIButton getButtonWithLightFontSize:14 TextColorHex:@"#FFFFFF" backGroundColor:@"" superView:_headerView masonrySet:^(UIButton *view, MASConstraintMaker *make) {
        STRONGSELF
        make.centerX.equalTo(strongSelf.headerView.mas_centerX).offset(-100);
        make.top.equalTo(strongSelf.titleLabel.mas_bottom).offset(20);
        [view setTitle:@"1" forState:UIControlStateNormal];
        if (IOS9) {
            view.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
        } else {
            view.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        }
        [view addTarget:self action:@selector(didInLoanButton) forControlEvents:UIControlEventTouchUpInside];
    }];
    
    _lineView = [UIView getViewWithColor:[UIColor colorWithHex:@"#FFFFFF"] superView:_headerView masonrySet:^(UIView *view, MASConstraintMaker *make) {
        STRONGSELF
        make.centerX.equalTo(strongSelf.inLoanButton.mas_centerX);
        make.top.equalTo(strongSelf.inLoanButton.mas_bottom).offset(8);
        make.height.offset(2);
        make.width.offset(24);
    }];
    // 已完结
    _hasEndedButton = [UIButton getButtonWithLightFontSize:14 TextColorHex:@"#bfc5f1" backGroundColor:@"" superView:_headerView masonrySet:^(UIButton *view, MASConstraintMaker *make) {
        STRONGSELF
        make.centerX.equalTo(strongSelf.headerView.mas_centerX).offset(100);
        make.top.equalTo(strongSelf.titleLabel.mas_bottom).offset(20);
        [view setTitle:@"2" forState:UIControlStateNormal];
        if (IOS9) {
            view.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
        } else {
            view.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        }
        [view addTarget:self action:@selector(didhasEndedButton) forControlEvents:UIControlEventTouchUpInside];
    }];
    
}

- (UIView *)inLoanTableHeaderView{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 144)];
    
    [UIView getViewWithColorHex:@"#6375E6" superView:headerView masonrySet:^(UIView *view, MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.offset(72);
    }];
    
    UIView *suspensionView = [UIView getViewWithColorHex:@"#FFFFFF" superView:headerView masonrySet:^(UIView *view, MASConstraintMaker *make) {
        make.left.offset(16);
        make.right.offset(-16);
        make.bottom.offset(-4);
        make.top.offset(0);
        view.layer.shadowColor = [UIColor colorWithHex:@"#E6E6E6"].CGColor;
        view.layer.shadowOffset = CGSizeMake(0, 2);
        view.layer.shadowOpacity = 0.5;
    }];
    
    [UIImageView getImageViewWithImageName:@"MyProject_topImg" superView:suspensionView masonrySet:^(UIImageView *view, MASConstraintMaker *make) {
        make.top.right.offset(0);
    }];
    
    WEAKSELF
    UILabel *pengdingMoneyTip = [UILabel getLabelWithFontSize:13 textColorHex:@"#999999" superView:suspensionView masonrySet:^(UILabel *view, MASConstraintMaker *make) {
        make.left.top.offset(14);
        make.height.offset(15);
        view.text = @"title";
    }];
    
    _pendingMoney = [UILabel getLabelWithSemiBoldFontSize:36 textColorHex:@"#010101" superView:suspensionView masonrySet:^(UILabel *view, MASConstraintMaker *make) {
        make.top.equalTo(pengdingMoneyTip.mas_bottom).offset(8);
        make.left.offset(14);
        make.height.offset(40);
        view.text = @"centent";
    }];
    
    UILabel *pendingCapitalTip = [UILabel getLabelWithFontSize:13 textColorHex:@"#999999" superView:suspensionView masonrySet:^(UILabel *view, MASConstraintMaker *make) {
        STRONGSELF
        make.top.equalTo(strongSelf.pendingMoney.mas_bottom).offset(16);
        make.left.offset(14);
        make.height.offset(15);
        view.text = @"detail";
    }];
    
    [UIView getViewWithColorHex:@"#BDBDBD" superView:suspensionView masonrySet:^(UIView *view, MASConstraintMaker *make) {
        STRONGSELF
        make.width.offset(1);
        make.height.offset(30);
        make.left.equalTo(pendingCapitalTip.mas_right).offset(32);
        make.top.equalTo(strongSelf.pendingMoney.mas_bottom).offset(16);
    }];
    
    UILabel *pendingInterestTip = [UILabel getLabelWithFontSize:13 textColorHex:@"#999999" superView:suspensionView masonrySet:^(UILabel *view, MASConstraintMaker *make) {
        STRONGSELF
        make.top.equalTo(strongSelf.pendingMoney.mas_bottom).offset(16);
        make.left.equalTo(pendingCapitalTip.mas_right).offset(65);
        make.height.offset(15);
        view.text = @"detail";
    }];
    
    _pendingCapital = [UILabel getLabelWithFontSize:17 textColorHex:@"#6375E6" superView:suspensionView masonrySet:^(UILabel *view, MASConstraintMaker *make) {
        make.left.offset(14);
        make.top.equalTo(pendingCapitalTip.mas_bottom).offset(4);
        make.height.offset(15);
        view.text = @"text";
    }];
    
    _pendingInterest = [UILabel getLabelWithFontSize:17 textColorHex:@"#6375E6" superView:suspensionView masonrySet:^(UILabel *view, MASConstraintMaker *make) {
        make.left.equalTo(pendingInterestTip.mas_left);
        make.top.equalTo(pendingInterestTip.mas_bottom).offset(4);
        make.height.offset(15);
        view.text = @"text";
    }];
    
    return headerView;
}

- (UIView *)hasEndedTableHeaderView{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 144)];
    
    [UIView getViewWithColorHex:@"#6375E6" superView:headerView masonrySet:^(UIView *view, MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.offset(72);
    }];
    
    UIView *suspensionView = [UIView getViewWithColorHex:@"#FFFFFF" superView:headerView masonrySet:^(UIView *view, MASConstraintMaker *make) {
        make.left.offset(16);
        make.right.offset(-16);
        make.bottom.offset(-4);
        make.top.offset(0);
        view.layer.shadowColor = [UIColor colorWithHex:@"#E6E6E6"].CGColor;
        view.layer.shadowOffset = CGSizeMake(0, 2);
        view.layer.shadowOpacity = 0.5;
    }];
    
    [UIImageView getImageViewWithImageName:@"MyProject_topImg" superView:suspensionView masonrySet:^(UIImageView *view, MASConstraintMaker *make) {
        make.top.right.offset(0);
    }];
    
    WEAKSELF
    UILabel *pengdingMoneyTip = [UILabel getLabelWithFontSize:13 textColorHex:@"#999999" superView:suspensionView masonrySet:^(UILabel *view, MASConstraintMaker *make) {
        make.left.top.offset(14);
        make.height.offset(15);
        view.text = @"title";
    }];
    
    _historyTotalRepayment = [UILabel getLabelWithSemiBoldFontSize:36 textColorHex:@"#010101" superView:suspensionView masonrySet:^(UILabel *view, MASConstraintMaker *make) {
        make.top.equalTo(pengdingMoneyTip.mas_bottom).offset(8);
        make.left.offset(14);
        make.height.offset(40);
        view.text = @"content";
    }];
    
    UILabel *hasCapitalTip = [UILabel getLabelWithFontSize:13 textColorHex:@"#999999" superView:suspensionView masonrySet:^(UILabel *view, MASConstraintMaker *make) {
        STRONGSELF
        make.top.equalTo(strongSelf.historyTotalRepayment.mas_bottom).offset(16);
        make.left.offset(14);
        make.height.offset(15);
        view.text = @"detail";
    }];
    
    [UIView getViewWithColorHex:@"#BDBDBD" superView:suspensionView masonrySet:^(UIView *view, MASConstraintMaker *make) {
        STRONGSELF
        make.width.offset(1);
        make.height.offset(30);
        make.left.equalTo(hasCapitalTip.mas_right).offset(32);
        make.top.equalTo(strongSelf.historyTotalRepayment.mas_bottom).offset(16);
    }];
    
    UILabel *hasInterestTip = [UILabel getLabelWithFontSize:13 textColorHex:@"#999999" superView:suspensionView masonrySet:^(UILabel *view, MASConstraintMaker *make) {
        STRONGSELF
        make.top.equalTo(strongSelf.historyTotalRepayment.mas_bottom).offset(16);
        make.left.equalTo(hasCapitalTip.mas_right).offset(65);
        make.height.offset(15);
        view.text = @"detail";
    }];
    
    _hasCapital = [UILabel getLabelWithFontSize:17 textColorHex:@"#6375E6" superView:suspensionView masonrySet:^(UILabel *view, MASConstraintMaker *make) {
        make.left.offset(14);
        make.top.equalTo(hasCapitalTip.mas_bottom).offset(4);
        make.height.offset(15);
        view.text = @"text";
    }];
    
    _hasInterest = [UILabel getLabelWithFontSize:17 textColorHex:@"#6375E6" superView:suspensionView masonrySet:^(UILabel *view, MASConstraintMaker *make) {
        make.left.equalTo(hasInterestTip.mas_left);
        make.top.equalTo(hasInterestTip.mas_bottom).offset(4);
        make.height.offset(15);
        view.text = @"text";
    }];
    
    return headerView;
}

- (UIView *)tableFooterView{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
    self.adsView = [[GADBannerView alloc] initWithAdSize:GADAdSizeFromCGSize(CGSizeMake([UIScreen mainScreen].bounds.size.width - 40, 80)) origin:CGPointMake(20, 10)];
    self.adsView.backgroundColor = [UIColor redColor];
    self.adsView.delegate = self;
    [footerView addSubview:self.adsView];
    return footerView;
}

- (void)didInLoanButton{
    self.leftTableView.hidden = NO;
    self.rightTableView.hidden = YES;
    [self.inLoanButton setTitleColor:[UIColor colorWithHex:@"#FFFFFF"] forState:UIControlStateNormal];
    [self.hasEndedButton setTitleColor:[UIColor colorWithHex:@"#bfc5f1"] forState:UIControlStateNormal];
    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.inLoanButton.mas_centerX);
        make.top.equalTo(self.inLoanButton.mas_bottom).offset(8);
        make.height.offset(2);
        make.width.offset(24);
    }];
    [self.leftTableView reloadData];
}

- (void)didhasEndedButton{
    self.leftTableView.hidden = YES;
    self.rightTableView.hidden = NO;
    [self.hasEndedButton setTitleColor:[UIColor colorWithHex:@"#FFFFFF"] forState:UIControlStateNormal];
    [self.inLoanButton setTitleColor:[UIColor colorWithHex:@"#bfc5f1"] forState:UIControlStateNormal];
    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.hasEndedButton.mas_centerX);
        make.top.equalTo(self.hasEndedButton.mas_bottom).offset(8);
        make.height.offset(2);
        make.width.offset(24);
    }];
    [self.rightTableView reloadData];
}

#pragma mark KVC 回调
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSString *tempContext = (__bridge NSString *)context;
    WEAKSELF
    if ([keyPath isEqualToString:@"contentOffset"]){
        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
        if (offset.y <= 0 && -offset.y > (iPhoneX ? 88 : 64)) {
            CGRect newFrame = CGRectMake(0, 0, self.view.frame.size.width, -offset.y);
            _headerView.frame = newFrame;
            __block CGFloat alpha = 1;
            if (-offset.y <=kMyProjectTopViewheight){
                if ([tempContext isEqualToString:@"inloanTable"]) {
                    self.leftTableView.contentInset = UIEdgeInsetsMake(-offset.y, 0, 0, 0);
                }else{
                    self.rightTableView.contentInset = UIEdgeInsetsMake(-offset.y, 0, 0, 0);
                }
                [self.inLoanButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                    STRONGSELF
                    make.centerX.equalTo(strongSelf.headerView.mas_centerX).offset(-100);
                    if ((offset.y + kMyProjectTopViewheight - 20) >= (iPhoneX ? (24) : (4))) {
                        make.top.offset(iPhoneX ? (40) : (20));
                        strongSelf.titleLabel.alpha = 0;
                    }else{
                        make.top.equalTo(strongSelf.titleLabel.mas_bottom).offset(-offset.y - kMyProjectTopViewheight + 20);
                        alpha = (-offset.y - kMyProjectTopViewheight + 30)/30;
                        strongSelf.titleLabel.alpha = alpha;
                    }
                }];
                [self.hasEndedButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                    STRONGSELF
                     make.centerX.equalTo(strongSelf.headerView.mas_centerX).offset(100);
                     if ((offset.y + kMyProjectTopViewheight - 20) >= (iPhoneX ? (24) : (4))) {
                         make.top.offset(iPhoneX ? (40) : (20));
                     }else{
                         make.top.equalTo(strongSelf.titleLabel.mas_bottom).offset(-offset.y - kMyProjectTopViewheight + 20);
                 }
                }];
            }else{
                self.titleLabel.alpha = 1;
                if ([tempContext isEqualToString:@"inloanTable"]) {
                    CGRect newFrame = CGRectMake(0, -offset.y - kMyProjectTopViewheight, self.view.frame.size.width, kMyProjectTopViewheight);
                    _headerView.frame = newFrame;
                }else{
                    CGRect newFrame = CGRectMake(0, 0, self.view.frame.size.width, -offset.y);
                    _headerView.frame = newFrame;
                }
                
                [self.inLoanButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                    STRONGSELF
                    make.centerX.equalTo(self.headerView.mas_centerX).offset(-100);
                    make.top.equalTo(strongSelf.titleLabel.mas_bottom).offset(20);
                }];
                [self.hasEndedButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                    STRONGSELF
                    make.centerX.equalTo(self.headerView.mas_centerX).offset(100);
                    make.top.equalTo(strongSelf.titleLabel.mas_bottom).offset(20);
                }];
            }
        } else {
            self.titleLabel.alpha = 0;
            [self.inLoanButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.headerView.mas_centerX).offset(-100);
                make.top.offset(iPhoneX ? (40) : (20));
            }];
            [self.hasEndedButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.headerView.mas_centerX).offset(100);
                make.top.offset(iPhoneX ? (40) : (20));
            }];
            CGRect newFrame = CGRectMake(0, 0, self.view.frame.size.width, iPhoneX ? 88 : 64);
            _headerView.frame = newFrame;
            if ([tempContext isEqualToString:@"inloanTable"]) {
                self.leftTableView.contentInset = UIEdgeInsetsMake(iPhoneX ? 88 : 64, 0, 0, 0);
            }else{
                self.rightTableView.contentInset = UIEdgeInsetsMake(iPhoneX ? 88 : 64, 0, 0, 0);
            }
        }
    }
}

- (void)endRefresh{
    [self.leftTableView.mj_header endRefreshing];
    [self.leftTableView.mj_footer endRefreshingWithNoMoreData];
}

#pragma makr - Delegate
- (void)interstitialDidDismissScreen:(GADInterstitial *)ad{
    self.interstitial = [self createAndLoadInterstitial];
}

- (void)didSelectTableRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.interstitial isReady]) {
        [self.interstitial presentFromRootViewController:self];
    }
}

/// Tells the delegate an ad request loaded an ad.
- (void)adViewDidReceiveAd:(GADBannerView *)adView {
    NSLog(@"adViewDidReceiveAd");
}

/// Tells the delegate an ad request failed.
- (void)adView:(GADBannerView *)adView
didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"adView:didFailToReceiveAdWithError: %@", [error localizedDescription]);
}

/// Tells the delegate that a full-screen view will be presented in response
/// to the user clicking on an ad.
- (void)adViewWillPresentScreen:(GADBannerView *)adView {
    NSLog(@"adViewWillPresentScreen");
}

/// Tells the delegate that the full-screen view will be dismissed.
- (void)adViewWillDismissScreen:(GADBannerView *)adView {
    NSLog(@"adViewWillDismissScreen");
}

/// Tells the delegate that the full-screen view has been dismissed.
- (void)adViewDidDismissScreen:(GADBannerView *)adView {
    NSLog(@"adViewDidDismissScreen");
}

/// Tells the delegate that a user click will open another app (such as
/// the App Store), backgrounding the current app.
- (void)adViewWillLeaveApplication:(GADBannerView *)adView {
    NSLog(@"adViewWillLeaveApplication");
}
#pragma mark - lazyLoading
- (RMGroupShadowTableView *)leftTableView{
    if (!_leftTableView) {
        _leftTableView = [[RMGroupShadowTableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        _leftTableView.groupShadowDelegate = self.myProjectUI;
        _leftTableView.groupShadowDataSource = self.myProjectUI;
        _leftTableView.contentInset = UIEdgeInsetsMake(kMyProjectTopViewheight, 0, 0, 0);
        _leftTableView.showSeparator = NO;
        _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _leftTableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _leftTableView.tableHeaderView = [self inLoanTableHeaderView];
        _leftTableView.tableFooterView = [self tableFooterView];
        _leftTableView.showsVerticalScrollIndicator = NO;
        _leftTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            NSLog(@"aaa");
            [self performSelector:@selector(endRefresh) withObject:nil afterDelay:3];
        }];
        _leftTableView.mj_header.ignoredScrollViewContentInsetTop = 150;
        _leftTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            NSLog(@"bbb");
            [self performSelector:@selector(endRefresh) withObject:nil afterDelay:3];
        }];
    }
    return _leftTableView;
}

- (RMGroupShadowTableView *)rightTableView{
    if (!_rightTableView) {
        _rightTableView = [[RMGroupShadowTableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        _rightTableView.groupShadowDelegate = self.myProjectUI;
        _rightTableView.groupShadowDataSource = self.myProjectUI;
        _rightTableView.contentInset = UIEdgeInsetsMake(kMyProjectTopViewheight, 0, 0, 0);
        _rightTableView.showSeparator = NO;
        _rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _rightTableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
//        _rightTableView.tableHeaderView = [self hasEndedTableHeaderView];
        _rightTableView.tableHeaderView = [self tableFooterView];
        _rightTableView.showsVerticalScrollIndicator = NO;
    }
    return _rightTableView;
}

- (RMMYProjectViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[RMMYProjectViewModel alloc] init];
    }
    return _viewModel;
}

- (RMMYProjectUI *)myProjectUI{
    if (!_myProjectUI) {
        _myProjectUI = [[RMMYProjectUI alloc] init];
        _myProjectUI.viewModel = self.viewModel;
        _myProjectUI.leftTableView = self.leftTableView;
        _myProjectUI.rightTableView = self.rightTableView;
        _myProjectUI.projectDelegate = self;
    }
    return _myProjectUI;
}

- (void)dealloc{
    [self.leftTableView removeObserver:self forKeyPath:@"contentOffset"];
    [self.rightTableView removeObserver:self forKeyPath:@"contentOffset"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
