//
//  ViewController.m
//  Jelbrek933
//
//  Created by zDevin on 2017-06-23.
//  Copyright © 2017 PMJelbrek. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIAlertController *alertCtrl;

@end

@implementation ViewController
-(BOOL)prefersStatusBarHidden{
    return YES;
}
// Sorry for really messy code
// I will adventually go back and clean it up
- (IBAction)oof:(id)sender {
    NSLog(@"Oof");
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Menu" message:@"Load URL To:" preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"Official Site (Defualt)" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Reload OG WEBSITE");
        NSString *urlSTRR = @"https://jbme.qwertyoruiop.com";
        NSLog(@"%@", urlSTRR);
        NSURL *urlToLoaad = [NSURL URLWithString:urlSTRR];
        
        NSURLRequest *urlReqq = [NSURLRequest requestWithURL:urlToLoaad];
        [_webView loadRequest:urlReqq];
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"https://repo.avalon-studios.de" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"https://repo.avalon-studios.de");
        NSString *urlST = @"https://repo.avalon-studios.de";
        NSLog(@"%@", urlST);
        NSURL *urlToLoaadd = [NSURL URLWithString:urlST];
        
        NSURLRequest *urlReqqq = [NSURLRequest requestWithURL:urlToLoaadd];
        [_webView loadRequest:urlReqqq];

        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Custom URL" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle: @"URL"
                                                                                  message: @"Input URL"
                                                                           preferredStyle:UIAlertControllerStyleAlert];
        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textInput) {
            textInput.placeholder = @"https://example.com";
            textInput.textColor = [UIColor blueColor];
            textInput.clearButtonMode = UITextFieldViewModeWhileEditing;
            textInput.borderStyle = UITextBorderStyleRoundedRect;
        }];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSArray * textfields = alertController.textFields;
            UITextField * URLIn = textfields[0];
            NSLog(@"%@",URLIn.text);
            // Load the new url
            NSString *NEWURL = URLIn.text;
            NSLog(@"%@", NEWURL);
            NSURL *NEWToLoad = [NSURL URLWithString:NEWURL];
            
            NSURLRequest *NEWReq = [NSURLRequest requestWithURL:NEWToLoad];
            [_webView loadRequest:NEWReq];
            
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [alert setModalPresentationStyle:UIModalPresentationPopover];
    
    UIPopoverPresentationController *popPresenter = [alert popoverPresentationController];
    popPresenter.sourceView = sender;
    [self presentViewController:alert animated:TRUE completion:nil];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *urlSTR = @"https://jbme.qwertyoruiop.com";
    NSLog(@"%@", urlSTR);
    NSURL *urlToLoad = [NSURL URLWithString:urlSTR];
    
    NSURLRequest *urlReq = [NSURLRequest requestWithURL:urlToLoad];
    [_webView loadRequest:urlReq];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
