//
//  RMMYProjectUI.h
//  RM
//
//  Created by Raymon on 2018/8/1.
//  CopRMight © 2018年 raymon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMGroupShadowTableView.h"
#import "RMMyProjectViewModel.h"
#import "RMGroupShadowTableView.h"

@protocol RMMYProjectUIDelegate <NSObject>
- (void)didSelectTableRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface RMMYProjectUI : NSObject<RMGroupShadowTableViewDelegate, RMGroupShadowTableViewDataSource>

@property (nonatomic, strong) RMMYProjectViewModel *viewModel;

@property (nonatomic, strong) RMGroupShadowTableView *leftTableView;

@property (nonatomic, strong) RMGroupShadowTableView *rightTableView;

@property (nonatomic, weak) id <RMMYProjectUIDelegate> projectDelegate;

@end
