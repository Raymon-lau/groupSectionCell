//
//  RMGroupShadowTableView.h
//  FaceMoney
//
//  Created by Raymon on 2018/7/27.
//  CopRMight ©2018年 raymon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RMGroupShadowTableView;
@protocol RMGroupShadowTableViewDelegate <NSObject>

@optional
- (void)RMGroupShadowTableView:(RMGroupShadowTableView *)tableView
       didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)RMGroupShadowTableView:(RMGroupShadowTableView *)tableView
          heightForRowAtIndexPath:(NSIndexPath *)indexPath;

- (UIView *)RMGroupShadowTableViewForFooterInTable:(UITableView *)table
                                 viewForInSection:(NSInteger)section;

- (UIView *)RMGroupShadowTableViewForHeaderInTable:(UITableView *)table
                                 viewForInSection:(NSInteger)section;

- (CGFloat)RMGroupShadowTableViewFooterInTabel:(UITableView *)table
                        heightForFooterInSection:(NSInteger)section;

- (CGFloat)RMGroupShadowTableViewForFooterInTabel:(UITableView *)table
                        heightForHeaderInSection:(NSInteger)section;

- (BOOL)RMGroupShadowTableView:(RMGroupShadowTableView *)tableView canSelectAtSection:(NSInteger)section;

@end

@protocol RMGroupShadowTableViewDataSource <NSObject>
@optional
- (NSInteger)numberOfSectionsInRMGroupShadowTableView:(RMGroupShadowTableView *)tableView;

@required

- (NSInteger)RMGroupShadowTableView:(RMGroupShadowTableView *)tableView numberOfRowsInSection:(NSInteger)section;

- (UITableViewCell *)RMGroupShadowTableView:(RMGroupShadowTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface RMGroupShadowTableView : UITableView
/**
 是否显示分割线  默认YES
 */
@property (nonatomic,assign) BOOL showSeparator;

@property (nonatomic,weak) IBOutlet id <RMGroupShadowTableViewDelegate> groupShadowDelegate;

@property (nonatomic,weak) IBOutlet id <RMGroupShadowTableViewDataSource> groupShadowDataSource;

@property (nonatomic,copy) NSInteger (^numberOfSectionsInRMGroupShadowTableView)(RMGroupShadowTableView *tableView);

@property (nonatomic,copy) NSInteger (^numberOfRowsInSection)(RMGroupShadowTableView *tableView,NSInteger section);

@property (nonatomic,copy) CGFloat (^heightForRowAtIndexPath)(RMGroupShadowTableView *tableView,NSIndexPath *indexPath);

@property (nonatomic,copy) UITableViewCell * (^cellForRowAtIndexPath)(RMGroupShadowTableView *tableView,NSIndexPath *indexPath);

@property (nonatomic,copy) void (^didSelectRowAtIndexPath)(RMGroupShadowTableView *tableView,NSIndexPath *indexPath);

//@property (nonatomic, assign) double groupShadowRowHeight;

@end
