//
//  FristViewController.m
//  CollectionView
//
//  Created by airende on 2016/10/17.
//  Copyright © 2016年 airende. All rights reserved.
//

#import "FristViewController.h"
#import "GeneralCollectionViewCell.h"
#import "CollectionHeaderReusableView.h"
#import "CollectionFooterReusableView.h"


#define W [[UIScreen mainScreen] bounds].size.width
#define H [[UIScreen mainScreen] bounds].size.height

@interface FristViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation FristViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    _collectionView.collectionViewLayout = flow;
    
    //控制每个item的间隙，可以用代理方法替代
    flow.minimumLineSpacing = 0;
    flow.minimumInteritemSpacing = 0;
    
    //item的注册
    [self.collectionView registerNib:[UINib nibWithNibName:@"GeneralCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"GeneralCollectionViewCell"];
    
    //sectionHeader注册 -> 设置区头大小  -> 返回方法
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CollectionHeaderReusableView class])  bundle:nil]  forSupplementaryViewOfKind :UICollectionElementKindSectionHeader  withReuseIdentifier:@"CollectionHeaderReusableView" ];
    
    //区尾注册
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CollectionFooterReusableView class])  bundle:nil]  forSupplementaryViewOfKind :UICollectionElementKindSectionFooter  withReuseIdentifier:@"CollectionFooterReusableView" ];
}


//分组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 2;
}

//每组个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 6;
}

//每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(W/4-0.3, 95);
}

//item
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
     GeneralCollectionViewCell * item = [collectionView dequeueReusableCellWithReuseIdentifier:@"GeneralCollectionViewCell" forIndexPath:indexPath];
    
    item.textLabel.text = [NSString stringWithFormat:@"第%ld个item",indexPath.row];
    
    return item;
}

//设置区头小大
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    return CGSizeMake(W, 60);

}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{

    return CGSizeMake(W, 30);
}

//区头区尾设置方法（复用）
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        CollectionHeaderReusableView *sectionHeaderView  =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:@"CollectionHeaderReusableView" forIndexPath:indexPath];
        
        return sectionHeaderView;
    }else{
    
        CollectionFooterReusableView *sectionFooterView  =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:@"CollectionFooterReusableView" forIndexPath:indexPath];
        
        return sectionFooterView;
        
    }
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
