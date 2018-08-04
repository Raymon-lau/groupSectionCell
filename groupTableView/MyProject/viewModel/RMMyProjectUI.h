//
//  RMMYProjectUI.h
//  RM
//
//  Created by Raymon on 2018/8/1.
//  CopRMight © 2018年 raymon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMGroupShadowTableView.h"
#import "RMMYProjectViewModel.h"
#import "RMGroupShadowTableView.h"

@interface RMMYProjectUI : NSObject<RMGroupShadowTableViewDelegate, RMGroupShadowTableViewDataSource>

@property (nonatomic, strong) RMMYProjectViewModel *viewModel;

@property (nonatomic, strong) RMGroupShadowTableView *leftTableView;

@property (nonatomic, strong) RMGroupShadowTableView *rightTableView;

@end
