//
//  UITableViewCell+BaseCellProtocol.m
//  DouDong-II
//
//  Created by Jobs on 2021/11/19.
//

#import "UITableViewCell+BaseCellProtocol.h"

@implementation UITableViewCell (BaseCellProtocol)

+(instancetype)cellWithTableView:(UITableView *)tableView{
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:ReuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:ReuseIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }return cell;
}

-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    if ([model isKindOfClass:UIViewModel.class]) {
        self.textLabel.textColor = model.textColor;
        self.textLabel.font = model.font;
        self.textLabel.text = model.text;
        self.imageView.image = model.image;
    }
}

+(CGFloat)cellHeightWithModel:(id _Nullable)model{
    return KWidth(44);
}

@end
