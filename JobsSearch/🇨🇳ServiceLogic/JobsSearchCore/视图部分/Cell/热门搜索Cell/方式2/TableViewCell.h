//
//  TableViewCell.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

@property(nonatomic,assign)long indexRow;
@property(nonatomic,assign)long indexSection;

+(instancetype)cellWithTableView:(UITableView *)tableView;
+(CGFloat)cellHeightWithModel:(id _Nullable)model;
-(void)richElementsInCellWithModel:(id _Nullable)model;

@end

NS_ASSUME_NONNULL_END
