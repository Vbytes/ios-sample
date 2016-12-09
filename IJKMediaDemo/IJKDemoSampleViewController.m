/*
 * Copyright (C) 2013-2015 Zhang Rui <bbcallen@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "IJKDemoSampleViewController.h"

#import "IJKCommon.h"
#import "IJKMoviePlayerViewController.h"

@interface IJKDemoSampleViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic,strong) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSArray *sampleList;

@end

@implementation IJKDemoSampleViewController

- (IJKDemoSampleViewController *) initWithFlag:(bool)isLive {
    self = [super init];
    self.isLive = isLive;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableArray *sampleList = [[NSMutableArray alloc] init];
    
    if (self.isLive == false) {
        self.title = @"点播资源列表";

        [sampleList addObject:@[@"小船儿推开波浪",
                            @"http://split.vbyte.cn/files/1read3.mp4"]];
        [sampleList addObject:@[@"星球大战 MP4",
                                @"http://vod.vbyte.cn/wasu7057551.mp4"]];
        [sampleList addObject:@[@"高清mp4",
                                @"http://vod.vbyte.cn/h264_1500k_mp4.mp4"]];
        [sampleList addObject:@[@"命中注定 flv",
                                @"http://vod.vbyte.cn/lalala.flv"]];
        [sampleList addObject:@[@"步步惊心",
                                @"http://wsmedia1.starschinalive.com/video/2016/7/21/20167211469069556503_0_4277.mp4"]];
        [sampleList addObject:@[@"china",
                                @"http://testvod.starschinalive.com/test/hls/high/2.m3u8"]];
        [sampleList addObject:@[@"bipbop basic",
                                @"http://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8"]];
        [sampleList addObject:@[@"ts0",
                                @"http://vod.vbyte.cn/hd-test1-0.ts"]];
        [sampleList addObject:@[@"ts1",
                                @"http://vod.vbyte.cn/hd-test1-1.ts"]];
    } else {
        self.title = @"直播频道列表";
        
        [sampleList addObject:@[@"安徽卫视",
                                @"14496521645631186"]];
        [sampleList addObject:@[@"CCTV5",
                                @"14395321695743290"]];
        [sampleList addObject:@[@"低延迟测试",
                                @"57aaf3603d6bc39a2c61f2e0"]];
    }

    self.sampleList = sampleList;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Samples";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (IOS_NEWER_OR_EQUAL_TO_7) {
        return self.sampleList.count;
    } else {
        return self.sampleList.count - 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"abc"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"abc"];
        cell.textLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    }

    cell.textLabel.text = self.sampleList[indexPath.row][0];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    NSArray *item = self.sampleList[indexPath.row];
    NSURL   *url  = [NSURL URLWithString:item[1]];

    [self.navigationController presentViewController:[[IJKVideoViewController alloc] initWithURL:url isLive:self.isLive] animated:YES completion:^{}];
}

@end
