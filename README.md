#  重写PYSearch
#warning：最近比较忙，工程是半成品，你们看得起就将就用，我忙过这阵再来统一的修复，有问题可以issues，我几乎每天都GitHub，如果你们有时间也可以拉分支给我提交。
![JobsSearch【OutLines 01】](https://user-images.githubusercontent.com/13795605/99760436-4b7a7400-2b26-11eb-81b9-8bef6549883f.png)
![JobsSearch【OutLines 02】](https://user-images.githubusercontent.com/13795605/99760441-4f0dfb00-2b26-11eb-87fc-1521365183b8.png)
![JobsSearch【OutLines 03】](https://user-images.githubusercontent.com/13795605/99760442-4fa69180-2b26-11eb-84ea-9238a78a4518.png)
![JobsSearch【OutLines 04】](https://user-images.githubusercontent.com/13795605/99760445-503f2800-2b26-11eb-86e7-6d3f3250dc6a.png)

# 我为什么写这个？吃饱了撑的？
## 见不惯PYSearch作者太浮夸了，要么不更新，要么只更新readme，其他关键的不更新，代码很凌乱，自恋狂
# 具体里面有什么彩蛋，自己下载来研究，我这里只说一个大概
1、整体架构是Tableview，因为我喜欢和熟悉Tableview，CollectionView也可以，但是我不愿意
2、输入框了里面做了动效
3、存历史数据用NSUserDefault
...

## 精华部分：tableviewcell 高度自适应
JobsSearchShowHotwordsTBVCell 里面有hotLabel
JobsSearchShowHotwordsTBVCell 是 UITableViewCell

先走 cellForRowAtIndexPath
再走 heightForRowAtIndexPath
走完以后 tableviewcell里面因为有了高度，才开始被撑开，撑开必然调用控件的布局界面的刷新，如果此时tableviewcell里面有控件，需要依据此控件来回馈一个高度值给tableviewcell就不满足系统的生命周期
我就想到了用通知，得到了高度实时传给VC，然后对tableviewcell的高度进行赋值，然后刷新界面
