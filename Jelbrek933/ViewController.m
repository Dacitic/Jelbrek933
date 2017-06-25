#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIAlertController *alertCtrl;
@end
@implementation ViewController
-(BOOL)prefersStatusBarHidden {
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
        NSLog(@"https://jbme.qwertyoruiop.com (Defualt)");
    }
    else if( theOof == 2 )
    {
        NSURLRequest *JbmeREQ = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://repo.avalon-studios.de"]];
        
        [_webView loadRequest:JbmeREQ];
        NSLog(@"https://repo.avalonn-studios.de");
    }
    else
    {
        NSLog(@"Something Broke... Loading and setting to https://jbme.qwertyoruiop.com anyways");
        NSURLRequest *JbmeREQ = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://jbme.qwertyoruiop.com"]];
        
        [_webView loadRequest:JbmeREQ];
        
        NSUserDefaults *defaultOdof = [NSUserDefaults standardUserDefaults];
        [defaultOdof setInteger:1 forKey:@"URLoad"];
        [defaultOdof synchronize];
        NSLog(@"Setting Back To https://jbme.qwertyoruiop.com Because Something Broke");
    }
}
- (IBAction)oof:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Menu" message:@"Main Menu" preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"https://jbme.qwertyoruiop.com" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"Reload OG WEBSITE");
        
        
        NSURL *urlToLoaad = [NSURL URLWithString:@"https://jbme.qwertyoruiop.com"];
        
        NSURLRequest *urlReqq = [NSURLRequest requestWithURL:urlToLoaad];
        
        [_webView loadRequest:urlReqq];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"https://repo.avalon-studios.de" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSURL *avalon = [NSURL URLWithString:@"https://repo.avalon-studios.de"];
        
        NSURLRequest *ReqAvalon = [NSURLRequest requestWithURL:avalon];
        [_webView loadRequest:ReqAvalon];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Tools" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
    {
        UIAlertController *alertTwo = [UIAlertController alertControllerWithTitle:@"Tools" message:@"Tools Menu" preferredStyle:UIAlertControllerStyleActionSheet];
        [alertTwo addAction:[UIAlertAction actionWithTitle:@"Defualt URL" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
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
            
            [alertForDef addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){NSLog(@"Cancel");}]];
            [alertForDef setModalPresentationStyle:UIModalPresentationPopover];
            
            UIPopoverPresentationController *popPresenter = [alertForDef popoverPresentationController];
            popPresenter.sourceView = sender;
            [self presentViewController:alertForDef animated:FALSE completion:nil];

        }]];

        
        [alertTwo addAction:[UIAlertAction actionWithTitle:@"Credits" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UIAlertController * alertCred = [UIAlertController alertControllerWithTitle:@"Credits"
                                         message:@"Dacitic (Concept And Main Code) Everyone On Github (Error Reports And Contributions)"
                                         preferredStyle:UIAlertControllerStyleAlert];
            
            
            
            UIAlertAction* backBtn = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) { NSLog(@"Cancel"); }];
            
            
            [alertCred addAction:backBtn];
            
            [self presentViewController:alertCred animated:YES completion:nil];
        }]];

        [alertTwo addAction:[UIAlertAction actionWithTitle:@"GitHub Repo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
        {
            NSURLRequest *JbmeREQ = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://github.com/Dacitic/Jelbrek933"]];
            
            [_webView loadRequest:JbmeREQ];
            
        }]];
        [alertTwo addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){NSLog(@"Cancel");}]];
        [alertTwo setModalPresentationStyle:UIModalPresentationPopover];
        UIPopoverPresentationController *popPresenter = [alertTwo popoverPresentationController];
        popPresenter.sourceView = sender;
        [self presentViewController:alertTwo animated:TRUE completion:nil];
        
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){NSLog(@"Cancel");}]];
    [alert setModalPresentationStyle:UIModalPresentationPopover];
    
    UIPopoverPresentationController *popPresenter = [alert popoverPresentationController];
    popPresenter.sourceView = sender;
    [self presentViewController:alert animated:TRUE completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"Memory Warning");
}


@end
