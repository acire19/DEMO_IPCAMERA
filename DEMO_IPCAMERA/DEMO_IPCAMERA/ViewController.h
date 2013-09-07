//
//  ViewController.h
//  DEMO_IPCAMERA
//


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property  UIWebView	*webView;		// Ë l'oggetto che gestisce la vista dove Ë contenuta l'immagine che carichiamo dalla telecamera
										// Ë una property di questa classe per cui Ë visibile/modificabile in tutti i punti della classe..
@property  NSTimer	*timerCamera;		// Ë il timer che 'fire' ogni TIME_REFRESHe richiamando il metodo per il refresh della telecamera


@end
