//
//  RMMYProjectUI.m
//  RM
//
//  Created by Raymon on 2018/8/1.
//  CopRMight © 2018年 raymon. All rights reserved.
//

#import "RMMyProjectUI.h"

@interface RMMYProjectUI ()

@end
@implementation RMMYProjectUI

- (NSInteger)numberOfSectionsInRMGroupShadowTableView:(RMGroupShadowTableView *)tableView{
    return 7;
}

- (NSInteger)RMGroupShadowTableView:(RMGroupShadowTableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)RMGroupShadowTableView:(RMGroupShadowTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld组第%ld行",(long)indexPath.section,(long)indexPath.row];
//     UIColor * randomColor= [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
//    cell.contentView.backgroundColor = randomColor;
    [self configCellWith:cell indexPath:indexPath];
    return cell;
    
}

- (void)configCellWith:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (CGFloat)RMGroupShadowTableView:(RMGroupShadowTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 132;
}

- (UIView *)RMGroupShadowTableViewForHeaderInTable:(UITableView *)table viewForInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    return headerView;
}

- (UIView *)RMGroupShadowTableViewForFooterInTable:(UITableView *)table viewForInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 10)];
    return footerView;
}

- (CGFloat)RMGroupShadowTableViewForFooterInTabel:(UITableView *)table heightForHeaderInSection:(NSInteger)section{
    return 20;
}

- (CGFloat)RMGroupShadowTableViewFooterInTabel:(UITableView *)table heightForFooterInSection:(NSInteger)section{
    return 10;
}

@end
