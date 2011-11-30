//
//  CameraViewController.m
//  alphaGLView
//
//  Created by Kasajima Yasuo on 11/11/30.
//  Copyright (c) 2011 kyoto. All rights reserved.
//

#import "CameraViewController.h"

@implementation CameraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
        _captureSession = [[AVCaptureSession alloc] init];
        AVCaptureDevice *videoCaptureDevice = nil;
        NSArray *cameraArray = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
        for (AVCaptureDevice *camera in cameraArray) {
            if (camera.position == AVCaptureDevicePositionBack) {
                videoCaptureDevice = camera;
            }
        }
        NSError *error = nil;
        AVCaptureDeviceInput *videoInput = [AVCaptureDeviceInput deviceInputWithDevice:videoCaptureDevice error:&error];
        if (videoInput) {
            [_captureSession addInput:videoInput];
            [_captureSession beginConfiguration];
            _captureSession.sessionPreset = AVCaptureSessionPresetHigh;
            [_captureSession commitConfiguration];

            AVCaptureVideoPreviewLayer *previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_captureSession];
            previewLayer.automaticallyAdjustsMirroring = NO;
            previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
            previewLayer.frame = self.view.bounds;
            [self.view.layer insertSublayer:previewLayer atIndex:0];
        }else {
            // Handle the failure.
            NSLog(@"ERROR:%@", error);
        }
        
        _imageOutput = [[AVCaptureStillImageOutput alloc] init];
        [_captureSession addOutput:_imageOutput];
        for(AVCaptureConnection *connection in _imageOutput.connections){
            if (connection.supportsVideoOrientation) {
                //データの向きを横向きにする
                connection.videoOrientation = AVCaptureVideoOrientationPortrait;
            }
        }
        
        // キャプチャセッションを開始
        [_captureSession startRunning];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
