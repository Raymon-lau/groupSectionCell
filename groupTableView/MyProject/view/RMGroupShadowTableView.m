//
//  RMGroupShadowTableView.m
//  FaceMoney
//
//  Created by Raymon on 2018/7/30.
//  CopRMight © 2018年 raymon. All rights reserved.
//

#import "RMGroupShadowTableView.h"


@interface UIView (Add)

- (void)setCornerRadius:(CGFloat)radius withShadow:(BOOL)shadow withOpacity:(CGFloat)opacity;

@end

@implementation UIView (Add)


- (void)setCornerRadius:(CGFloat)radius withShadow:(BOOL)shadow withOpacity:(CGFloat)opacity {
    self.layer.cornerRadius = radius;
    if (shadow) {
        self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        self.layer.shadowOpacity = opacity;
        self.layer.shadowOffset = CGSizeMake(0, 2);
        self.layer.shadowRadius = 4;
        self.layer.shouldRasterize = NO;
        self.layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:[self bounds] cornerRadius:radius] CGPath];
    }
    self.layer.masksToBounds = !shadow;
}


@end

@class PlainTableViewCell;
@protocol PlainTableViewCellDelegate <NSObject>

- (NSInteger)plainTableViewCell:(PlainTableViewCell *)cell numberOfRowsInSection:(NSInteger)section;

- (CGFloat)plainTableViewCell:(PlainTableViewCell *)cell heightForRowAtIndexPath:(NSIndexPath *)indexPath;

- (UITableViewCell *)plainTableViewCell:(PlainTableViewCell *)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface PlainTableViewCell : UITableViewCell <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak,nullable) id<PlainTableViewCellDelegate> delegate;

@property (nonatomic,assign) BOOL showSeparator;

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,copy) NSInteger (^numberOfRowsInSection)(PlainTableViewCell *plainCell,NSInteger section);

@property (nonatomic,copy) UITableViewCell * (^cellForRowAtIndexPath)(PlainTableViewCell *plainCell,NSIndexPath *indexPath);

@property (nonatomic,copy) CGFloat (^heightForRowAtIndexPath)(PlainTableViewCell *plainCell,NSIndexPath *indexPath);

@property (nonatomic,copy) void (^didSelectRowAtIndexPath)(PlainTableViewCell *plainCell,NSIndexPath *indexPath);

- (void)deselectCell;

- (void)selectCell:(NSInteger)row;

@end

@interface RMGroupShadowTableView () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) PlainTableViewCell *selectedCell;

@property (nonatomic,strong) NSIndexPath *selectedIndexPath;

@end

@implementation RMGroupShadowTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self initializeUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initializeUI];
    }
    return self;
}

-(void)initializeUI {
    [self registerClass:[PlainTableViewCell class] forCellReuseIdentifier:@"PlainTableViewCell"];
    self.delegate = self;
    self.dataSource = self;
}

- (void)deselectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated {
    PlainTableViewCell *cell = [self cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.section]];
    [cell.tableView deselectRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0] animated:animated];
}

//MARK: - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.numberOfSectionsInRMGroupShadowTableView) {
        return self.numberOfSectionsInRMGroupShadowTableView(self);
    }else if (self.groupShadowDataSource && [self.groupShadowDataSource respondsToSelector:@selector(numberOfSectionsInRMGroupShadowTableView:)]) {
        return [self.groupShadowDataSource numberOfSectionsInRMGroupShadowTableView:self];
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlainTableViewCell"];
    cell.showSeparator = self.showSeparator;
    cell.tableView.separatorInset = self.separatorInset;
    if (self.groupShadowDelegate && [self.groupShadowDelegate respondsToSelector:@selector(RMGroupShadowTableView:canSelectAtSection:)]) {
        cell.tableView.allowsSelection = [self.groupShadowDelegate RMGroupShadowTableView:self canSelectAtSection:indexPath.section];
    }else {
        cell.tableView.allowsSelection = self.allowsSelection;
    }
    cell.tag = indexPath.section + 100; //标记是第几组
    __weak typeof(self) weakSelf = self;
    [cell setNumberOfRowsInSection:^NSInteger(PlainTableViewCell *plainTableViewCell, NSInteger section) {
        if (weakSelf.numberOfRowsInSection) {
            return weakSelf.numberOfRowsInSection(weakSelf,section);
        }else if (weakSelf.groupShadowDataSource && [weakSelf.groupShadowDataSource respondsToSelector:@selector(RMGroupShadowTableView:numberOfRowsInSection:)]) {
            return [weakSelf.groupShadowDataSource RMGroupShadowTableView:weakSelf numberOfRowsInSection:section];
        }
        return 0;
    }];
    
    [cell setHeightForRowAtIndexPath:^CGFloat(PlainTableViewCell *plainTableViewCell, NSIndexPath *indexPath) {
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:plainTableViewCell.tag - 100];
        if (weakSelf.heightForRowAtIndexPath) {
            return  weakSelf.heightForRowAtIndexPath(weakSelf,newIndexPath);
        }else if (weakSelf.groupShadowDelegate && [weakSelf.groupShadowDelegate respondsToSelector:@selector(RMGroupShadowTableView:heightForRowAtIndexPath:)]) {
            return [weakSelf.groupShadowDelegate RMGroupShadowTableView:weakSelf heightForRowAtIndexPath:newIndexPath];
        }
        return 0;
    }];
    
    [cell setCellForRowAtIndexPath:^UITableViewCell *(PlainTableViewCell *plainTableViewCell, NSIndexPath *indexPath) {
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:plainTableViewCell.tag - 100];
        if (weakSelf.cellForRowAtIndexPath) {
            return  weakSelf.cellForRowAtIndexPath(weakSelf,newIndexPath);
        }else if (weakSelf.groupShadowDataSource && [weakSelf.groupShadowDataSource respondsToSelector:@selector(RMGroupShadowTableView:cellForRowAtIndexPath:)]) {
            return [weakSelf.groupShadowDataSource RMGroupShadowTableView:weakSelf cellForRowAtIndexPath:newIndexPath];
        }
        return nil;
    }];
    
    [cell setDidSelectRowAtIndexPath:^(PlainTableViewCell *plainTableViewCell, NSIndexPath *indexPath) {
        
        NSInteger actualSection = plainTableViewCell.tag - 100;
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:actualSection];
        if (weakSelf.selectedCell && weakSelf.selectedCell != plainTableViewCell) {
            [weakSelf.selectedCell deselectCell];
        }
        if (weakSelf.didSelectRowAtIndexPath) {
            weakSelf.didSelectRowAtIndexPath(weakSelf,newIndexPath);
        }else if (weakSelf.groupShadowDelegate && [weakSelf.groupShadowDelegate respondsToSelector:@selector(RMGroupShadowTableView:didSelectRowAtIndexPath:)]) {
            [weakSelf.groupShadowDelegate RMGroupShadowTableView:weakSelf didSelectRowAtIndexPath:newIndexPath];
        }
        self.selectedIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:actualSection];
        self.selectedCell = plainTableViewCell;
    }];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    PlainTableViewCell *ptCell = (PlainTableViewCell *)cell;
    [ptCell.tableView reloadData];
    if (indexPath.section == self.selectedIndexPath.section) {
        [self.selectedCell selectCell:self.selectedIndexPath.row];
    }
}

//MARK: - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger totalRows = 0;
    if (self.numberOfRowsInSection) {
        totalRows = self.numberOfRowsInSection(self,indexPath.section);
    }else if (self.groupShadowDataSource && [self.groupShadowDataSource respondsToSelector:@selector(RMGroupShadowTableView:numberOfRowsInSection:)]) {
        totalRows = [self.groupShadowDataSource RMGroupShadowTableView:self numberOfRowsInSection:indexPath.section];
    }
    
    CGFloat totalHeight = 0;
    for (int i = 0; i < totalRows; i ++) {
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:i inSection:indexPath.section];
        if (self.heightForRowAtIndexPath) {
            totalHeight += self.heightForRowAtIndexPath(self,newIndexPath);
        }else if (self.groupShadowDelegate && [self.groupShadowDelegate respondsToSelector:@selector(RMGroupShadowTableView:heightForRowAtIndexPath:)]) {
            totalHeight += [self.groupShadowDelegate RMGroupShadowTableView:self heightForRowAtIndexPath:newIndexPath];
        }
    }
    return totalHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.groupShadowDelegate && [self.groupShadowDelegate respondsToSelector:@selector(RMGroupShadowTableViewForHeaderInTable:viewForInSection:)]) {
        return [self.groupShadowDelegate RMGroupShadowTableViewForHeaderInTable:tableView viewForInSection:section];
    }else{
        return nil;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (self.groupShadowDelegate && [self.groupShadowDelegate respondsToSelector:@selector(RMGroupShadowTableViewForFooterInTable:viewForInSection:)]) {
        return [self.groupShadowDelegate RMGroupShadowTableViewForFooterInTable:tableView viewForInSection:section];
    }else{
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.groupShadowDelegate && [self.groupShadowDelegate respondsToSelector:@selector(RMGroupShadowTableViewForFooterInTabel:heightForHeaderInSection:)]) {
        return [self.groupShadowDelegate RMGroupShadowTableViewForFooterInTabel:tableView heightForHeaderInSection:section];
    }else{
        return 0.1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (self.groupShadowDelegate && [self.groupShadowDelegate respondsToSelector:@selector(RMGroupShadowTableViewFooterInTabel:heightForFooterInSection:)]) {
        return [self.groupShadowDelegate RMGroupShadowTableViewFooterInTabel:tableView heightForFooterInSection:section];
    }else{
        return 0.1;
    }
}

@end

//MARK: - PlainTableViewCell
@implementation PlainTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        
        self.tableView = [[UITableView alloc]initWithFrame:CGRectInset(self.bounds, 16, 0) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.scrollEnabled = NO;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.contentView addSubview:self.tableView];
        self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.tableView setCornerRadius:0 withShadow:YES withOpacity:0.5];
}

//MARK: - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.numberOfRowsInSection) {
        return self.numberOfRowsInSection(self,self.tag-100);
    }else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(plainTableViewCell:numberOfRowsInSection:)]) {
            return  [self.delegate plainTableViewCell:self numberOfRowsInSection:self.tag -100];
        }
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (self.cellForRowAtIndexPath) {
        cell = self.cellForRowAtIndexPath(self,indexPath);
    }else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(plainTableViewCell:cellForRowAtIndexPath:)]) {
            cell = [self.delegate plainTableViewCell:self cellForRowAtIndexPath:indexPath];
        }
    }
    NSAssert(cell, @"Cell不能为空");
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat cornerRadius = 8.f;
    cell.backgroundColor = UIColor.clearColor;
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    CAShapeLayer *backgroundLayer = [[CAShapeLayer alloc] init];
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGRect bounds = cell.bounds;
    
    NSInteger numberOfRows = 0;
    if (self.numberOfRowsInSection) {
        numberOfRows = self.numberOfRowsInSection(self,self.tag -100);
    }
    
    BOOL needSeparator = NO;
    
    if (indexPath.row == 0 && numberOfRows == 1) {
        CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius);
    }else if (indexPath.row == 0) {
        // 初始起点为cell的左下角坐标
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
        
        needSeparator = YES;
        
    } else if (indexPath.row == numberOfRows -1) {
        // 初始起点为cell的左上角坐标
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
    } else {
        CGPathAddRect(pathRef, nil, bounds);
        needSeparator = YES;
    }
    
    layer.path = pathRef;
    backgroundLayer.path = pathRef;
    CFRelease(pathRef);
    layer.fillColor = [UIColor whiteColor].CGColor;
    
    if (self.showSeparator && needSeparator) {
        CALayer *lineLayer = [[CALayer alloc] init];
        CGFloat lineHeight = (1.f / [UIScreen mainScreen].scale);
        lineLayer.frame = CGRectMake(self.separatorInset.left, bounds.size.height - lineHeight, bounds.size.width - (self.separatorInset.left + self.separatorInset.right), lineHeight);
        lineLayer.backgroundColor = self.tableView.separatorColor.CGColor;
        [layer addSublayer:lineLayer];
    }
    
    UIView *roundView = [[UIView alloc] initWithFrame:bounds];
    [roundView.layer insertSublayer:layer atIndex:0];
    roundView.backgroundColor = UIColor.clearColor;
    cell.backgroundView = roundView;
    
    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds];
    backgroundLayer.fillColor = [UIColor groupTableViewBackgroundColor].CGColor;
    [selectedBackgroundView.layer insertSublayer:backgroundLayer below:cell.layer];
    selectedBackgroundView.backgroundColor = UIColor.clearColor;
    cell.selectedBackgroundView = selectedBackgroundView;
}

//MARK: - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didSelectRowAtIndexPath) {
        self.didSelectRowAtIndexPath(self,indexPath);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.heightForRowAtIndexPath) {
        return self.heightForRowAtIndexPath(self,indexPath);
    }else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(plainTableViewCell:heightForRowAtIndexPath:)]) {
            return  [self.delegate plainTableViewCell:self heightForRowAtIndexPath:indexPath];
        }
    }
    return 0;
}

- (void)deselectCell {
    [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:NO];
}

- (void)selectCell:(NSInteger)row {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
}

@end
