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

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger theOof = [defaults integerForKey:@"URLoad"];
    
    if( theOof == 1 )
    {
        NSURLRequest *JbmeREQ = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://jbme.qwertyoruiop.com"]];
        
        [_webView loadRequest:JbmeREQ];
    }
    else if( theOof == 2 )
    {
        NSURLRequest *JbmeREQ = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://repo.avalon-studios.de"]];
        
        [_webView loadRequest:JbmeREQ];
    }
    else
    {
        NSLog(@"Something Broke... Loading and setting to https://jbme.qwertyoruiop.com anyways");
        NSURLRequest *JbmeREQ = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://jbme.qwertyoruiop.com"]];
        
        [_webView loadRequest:JbmeREQ];
        
        NSUserDefaults *defaultOdof = [NSUserDefaults standardUserDefaults];
        [defaultOdof setInteger:1 forKey:@"URLoad"];
        [defaultOdof synchronize];
        
    }
    
}
- (IBAction)oof:(id)sender { // Change URL Menu
    
    // UIAlertController (Setup)
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Menu" message:@"Main Menu" preferredStyle:UIAlertControllerStyleActionSheet];
    
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
    
    // Tools
    [alert addAction:[UIAlertAction actionWithTitle:@"Tools" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
    {
        /*
         TOOLS SECTION
         
         
        */
        UIAlertController *alertTwo = [UIAlertController alertControllerWithTitle:@"Tools" message:@"Tools Menu" preferredStyle:UIAlertControllerStyleActionSheet];
        [alertTwo addAction:[UIAlertAction actionWithTitle:@"Defualt URL" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            

            NSUserDefaults *defaultss = [NSUserDefaults standardUserDefaults];
            NSInteger FtheOof = [defaultss integerForKey:@"URLoad"];
            if( FtheOof == 1 )
            {
                NSString *setTo = @"https://jbme.qwertyoruiop.com";
                NSLog(@"%@", setTo);
            }
            else if( FtheOof == 2 )
            {
                NSString *setTo = @"https://repo.avalon-studios.de";
                NSLog(@"%@", setTo);
            }
            else
            {
                NSString *setTo = @"Unknown";
                NSLog(@"%@", setTo);
            }
            
            UIAlertController *alertForDef = [UIAlertController alertControllerWithTitle:@"Set Defualt URL" message:@"Set URL To Load On Startup" preferredStyle:UIAlertControllerStyleActionSheet];
            

            [alertForDef addAction:[UIAlertAction actionWithTitle:@"https://jbme.qwertyoruiop.com" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSUserDefaults *defaultOof = [NSUserDefaults standardUserDefaults];
                [defaultOof setInteger:1 forKey:@"URLoad"];
                [defaultOof synchronize];
                
            }]];

            [alertForDef addAction:[UIAlertAction actionWithTitle:@"https://repo.avalon-studios.de" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSUserDefaults *defaultdOof = [NSUserDefaults standardUserDefaults];
                [defaultdOof setInteger:2 forKey:@"URLoad"];
                [defaultdOof synchronize];
                
                
                
            }]];
            
            [alertForDef addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action)
                              {
                                  NSLog(@"Do Nothing...");
                                  NSLog(@"XCode Wont Let Me Do Nothing So I Have To Do This");
                                  // https://www.youtube.com/watch?v=0PoprikaT_4

                                  
                              }]];
            [alertForDef setModalPresentationStyle:UIModalPresentationPopover];
            
            UIPopoverPresentationController *popPresenter = [alertForDef popoverPresentationController];
            popPresenter.sourceView = sender;
            [self presentViewController:alertForDef animated:FALSE completion:nil];

        }]];

        
        [alertTwo addAction:[UIAlertAction actionWithTitle:@"Credits" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            // Credits Alert
            UIAlertController * alertCred = [UIAlertController alertControllerWithTitle:@"Credits"
                                         message:@"Dacitic (Concept And Main Code) Everyone On Github (Error Reports And Contributions)"
                                         preferredStyle:UIAlertControllerStyleAlert];
            
            
            
            UIAlertAction* backBtn = [UIAlertAction actionWithTitle:@"Back" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) { NSLog(@"Back"); }];
            
            
            [alertCred addAction:backBtn];
            
            [self presentViewController:alertCred animated:YES completion:nil];
           
            // Credits Over
            
        }]];

        [alertTwo addAction:[UIAlertAction actionWithTitle:@"GitHub Repo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
        {
            // Load Github Repo To WebView
            NSURLRequest *JbmeREQ = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://github.com/Dacitic/Jelbrek933"]];
            
            [_webView loadRequest:JbmeREQ];
            
        }]];
        [alertTwo addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action)
        {
            
        }]];
        [alertTwo setModalPresentationStyle:UIModalPresentationPopover];
        
        // Load UIAlert
        UIPopoverPresentationController *popPresenter = [alertTwo popoverPresentationController];
        popPresenter.sourceView = sender;
        [self presentViewController:alertTwo animated:TRUE completion:nil];
        
        /*
         TOOLS SECTION
         END
        */
        
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action)
    {
        
    }]];
    [alert setModalPresentationStyle:UIModalPresentationPopover];
    
    UIPopoverPresentationController *popPresenter = [alert popoverPresentationController];
    popPresenter.sourceView = sender;
    [self presentViewController:alert animated:TRUE completion:nil];
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
