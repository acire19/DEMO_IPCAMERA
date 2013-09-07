//
//  ViewController.m
//  DEMO_IPCAMERA
//


#import "ViewController.h"

#define TIME_REFRESH		10		// verr‡ effettuato un refresh della telecamera ogni 10 sec



@interface ViewController ()

@end
@implementation ViewController
@synthesize webView,timerCamera;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//========================================================================//
//==	METODO RICHIAMATO QUANDO COMPARE QUESTO UIViewController...	==//
//========================================================================//
-(void) viewDidLoad {

	[super viewDidLoad];	

	webView=[[UIWebView alloc] initWithFrame: CGRectMake(5,65, 310, 250)];	// alloco e inizializzo la web view con le dimensioni che desidero
	[self.view addSubview:webView];						// aggiungo questa view alla view principale di questo UIviewController...

	// inizializzo il timer e impongo ogni quanto deve 'firing', quale metodo richiamare, a quale classe fare riferimento etc.
	timerCamera=[NSTimer scheduledTimerWithTimeInterval:TIME_REFRESH target:self selector:@selector(ricaricaImgCamera) userInfo:nil repeats:YES];



}

//=======================================================//
//==	PRENDE DALLA IP CAMERA L'IMMAGINE ===============//
//=======================================================//
-(void) ricaricaImgCamera{

	NSString *str=@"http://guest:guest@16.0.1.15/jpg/image.jpg";	// costruisco in una stringa il path corretto
	NSURL *urlCam=[NSURL URLWithString:str];					// con la stringa costruisco l'NSURL
	NSURLRequest *reqUrl=[NSURLRequest requestWithURL:urlCam];	// con l'url creo un NSURLRequest
	[webView loadRequest: reqUrl];								// chiedo alla web view fare un load passandogli l'NSURL
	[webView setScalesPageToFit:YES];							// poiche' l'immagine dalla telecamera potrebbe esesre grande, la adatto alla mia finestra...

}

//=======================================================//
//=======================================================//
//=======================================================//
-(void) viewDidDisappear: (BOOL) animation {

	[super viewDidDisappear: YES];

	[timerCamera invalidate];		// questa classe era il 'target' del timer...
									// quando scompare questo UIViewController Ë suo compito fermare il timer...

}

@end			// chiusura classe...



