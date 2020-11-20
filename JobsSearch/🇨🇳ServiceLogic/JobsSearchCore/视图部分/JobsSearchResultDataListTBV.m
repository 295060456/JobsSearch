//
//  JobsSearchResultDataListTBV.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/6.
//

#import "JobsSearchResultDataListTBV.h"
#import "JobsSearchResultDataListTBVCell.h"

@interface JobsSearchResultDataListTBV ()

@end

@implementation JobsSearchResultDataListTBV

#pragma mark —————————— UITableViewDelegate,UITableViewDataSource ——————————
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{

}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{

}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    JobsSearchResultDataListTBVCell
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}


@end
