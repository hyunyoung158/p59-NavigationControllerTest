//
//  ViewController.m
//  NavigationControllerTest
//
//  Created by SDT-1 on 2014. 1. 10..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController {
    NSArray *_data;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_data count];
}

//프로토 타입 방식
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL_ID" forIndexPath:indexPath];
    cell.textLabel.text = [_data objectAtIndex:indexPath.row];
    
    return cell;
}

//URL을 디테일 뷰 컨트롤러로 전달
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *detailVC = segue.destinationViewController;
    //sender는 테이블의 셀!
    UITableViewCell *selectedCell = (UITableViewCell *)sender;
    //셀을 이용해서 indexPath를 얻어온다.
    NSIndexPath *selectedIndex = [self.table indexPathForCell:selectedCell];
    detailVC.urlStr = [_data objectAtIndex:selectedIndex.row];
}

- (void)viewWillAppear:(BOOL)animated {
    //navigationbar 숨기기
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    //navigationbar 보이기
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _data = @[@"apple.com", @"naver.com", @"google.com", @"daum.net"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
