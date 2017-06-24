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
/* Sorry for really messy code
I will adventually go back and clean it up */

- (IBAction)oof:(id)sender { // Change URL Menu
    
    // UIAlertController (Setup)
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Menu" message:@"Load URL To:" preferredStyle:UIAlertControllerStyleActionSheet];
    // UIAlertController (Add Load jbme.qwertyoruiop.com (Default Load... But Useful If You Want To Load Again...
    
    [alert addAction:[UIAlertAction actionWithTitle:@"https://jbme.qwertyoruiop.com" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Reload OG WEBSITE"); // debug
        
        
        NSURL *urlToLoaad = [NSURL URLWithString:@"https://jbme.qwertyoruiop.com"]; // load string
        
        NSURLRequest *urlReqq = [NSURLRequest requestWithURL:urlToLoaad]; // url
        
        [_webView loadRequest:urlReqq]; // load url
        
    }]];
    // UIAlertController (Add Load https://repo.avalon-studios.de (Secondary Server))
    [alert addAction:[UIAlertAction actionWithTitle:@"https://repo.avalon-studios.de" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSURL *avalon = [NSURL URLWithString:@"https://repo.avalon-studios.de"];
        
        NSURLRequest *ReqAvalon = [NSURLRequest requestWithURL:avalon];
        [_webView loadRequest:ReqAvalon];

        
    }]];
    // UIAlertController (Add Custom Load)
    [alert addAction:[UIAlertAction actionWithTitle:@"Custom URL" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle: @"URL"
                                                                                  message: @"Input URL (May Take A Few Seconds To Load...)"
                                                                           preferredStyle:UIAlertControllerStyleAlert];
        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textInput) {
            textInput.placeholder = @"https://example.com";
            textInput.textColor = [UIColor blueColor];
            textInput.clearButtonMode = UITextFieldViewModeWhileEditing;
            textInput.borderStyle = UITextBorderStyleRoundedRect;
        }];
        // UIAlertController (OK Button)
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSArray * textfields = alertController.textFields;
            UITextField * URLIn = textfields[0];
            NSLog(@"%@",URLIn.text);
            
            // Load the new url
            NSURL *NEWToLoad = [NSURL URLWithString:URLIn.text];
            
            NSURLRequest *NEWReq = [NSURLRequest requestWithURL:NEWToLoad];
            [_webView loadRequest:NEWReq]; // Load WebView
            
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
    
    NSURLRequest *JbmeREQ = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://jbme.qwertyoruiop.com"]];
    
    [_webView loadRequest:JbmeREQ];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
