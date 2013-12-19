//
//  WifiViewController.m
//  ios_wifi_manager
//
//  Created by leo on 13-11-16.
//  Copyright (c) 2013年 leo. All rights reserved.
//

#import "WifiViewController.h"
#import "WifiManager.h"

@interface WifiViewController ()
{
	UITextField * _broadcastAddressField;
	UITextField * _gateWayField;
	UITextField * _IPField;
	UITextField * _netMastField;
	UITextField * _interfaceField;
}

@end

@implementation WifiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	UILabel * interface = [[UILabel alloc] initWithFrame:CGRectMake(5, 50, 100, 40)];
	[interface setText:@"Interface:"];
	[interface setTextAlignment:NSTextAlignmentRight];
	[interface setFont:[UIFont systemFontOfSize:18]];
	[self.view addSubview:interface];
	
	_interfaceField = [[UITextField alloc] initWithFrame:CGRectMake(120, 50, 180, 40)];
	_interfaceField.borderStyle = UITextBorderStyleRoundedRect;
	[_interfaceField setFont:[UIFont systemFontOfSize:18]];
	[_interfaceField setTextAlignment:NSTextAlignmentLeft];
	[self.view addSubview:_interfaceField];
	
	UILabel * ip = [[UILabel alloc] initWithFrame:CGRectMake(5, 100, 100, 40)];
	[ip setText:@"Local IP:"];
	[ip setTextAlignment:NSTextAlignmentRight];
	[ip setFont:[UIFont systemFontOfSize:18]];
	[self.view addSubview:ip];
	
	_IPField = [[UITextField alloc] initWithFrame:CGRectMake(120, 100, 180, 40)];
	[_IPField setTextAlignment:NSTextAlignmentLeft];
	_IPField.borderStyle = UITextBorderStyleRoundedRect;
	[_IPField setFont:[UIFont systemFontOfSize:18]];
	[self.view addSubview:_IPField];
	
	UILabel * gateway = [[UILabel alloc] initWithFrame:CGRectMake(5, 150, 100, 40)];
	[gateway setText:@"GateWay:"];
	[gateway setTextAlignment:NSTextAlignmentRight];
	[gateway setFont:[UIFont systemFontOfSize:18]];
	[self.view addSubview:gateway];
	
	_gateWayField = [[UITextField alloc] initWithFrame:CGRectMake(120, 150, 180, 40)];
	[_gateWayField setTextAlignment:NSTextAlignmentLeft];
	_gateWayField.borderStyle = UITextBorderStyleRoundedRect;
	[_gateWayField setFont:[UIFont systemFontOfSize:18]];
	[self.view addSubview:_gateWayField];
	
	UILabel * netmast = [[UILabel alloc] initWithFrame:CGRectMake(5, 200, 100, 40)];
	[netmast setText:@"Net Mast"];
	[netmast setTextAlignment:NSTextAlignmentRight];
	[netmast setFont:[UIFont systemFontOfSize:18]];
	[self.view addSubview:netmast];
	
	_netMastField = [[UITextField alloc] initWithFrame:CGRectMake(120, 200, 180, 40)];
	[_netMastField setTextAlignment:NSTextAlignmentLeft];
	_netMastField.borderStyle = UITextBorderStyleRoundedRect;
	[_netMastField setFont:[UIFont systemFontOfSize:18]];
	[self.view addSubview:_netMastField];
	
	UILabel * broadcastAddress = [[UILabel alloc] initWithFrame:CGRectMake(5, 250, 100, 40)];
	[broadcastAddress setNumberOfLines:2];
	[broadcastAddress setText:@"BroadCast Address:"];
	[broadcastAddress setTextAlignment:NSTextAlignmentRight];
	[broadcastAddress setFont:[UIFont systemFontOfSize:18]];
	[self.view addSubview:broadcastAddress];
	
	_broadcastAddressField = [[UITextField alloc] initWithFrame:CGRectMake(120, 250, 180, 40)];
	_broadcastAddressField.borderStyle = UITextBorderStyleRoundedRect;
	[_broadcastAddressField setTextAlignment:NSTextAlignmentLeft];
	[_broadcastAddressField setFont:[UIFont systemFontOfSize:18]];
	[self.view addSubview:_broadcastAddressField];
	
	UIButton * searchBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[searchBtn setFrame:CGRectMake(100, 300, 120, 40)];
	[searchBtn setTitle:@"Search Wifi" forState:UIControlStateNormal];
	[searchBtn addTarget:self action:@selector(searchWIFI) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:searchBtn];
	// Do any additional setup after loading the view.
}

- (void)	searchWIFI
{
	WifiManager * manager = [[WifiManager alloc ] init];
	NSDictionary * wifiInfor = [manager getWifiInformation];
	if (wifiInfor != nil) {
		[_broadcastAddressField setText:(NSString *)[wifiInfor objectForKey:WifiBroadcastAddress]];
		[_netMastField setText:(NSString *)[wifiInfor objectForKey:WifiNetMast]];
		[_IPField setText:(NSString *)[wifiInfor objectForKey:WifiIP]];
		[_gateWayField	setText:(NSString *)[wifiInfor objectForKey:WifiGateWay]];
		[_interfaceField setText:(NSString *)[wifiInfor objectForKey:WifiInterface]];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
