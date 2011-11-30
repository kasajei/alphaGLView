//
//  CameraViewController.h
//  alphaGLView
//
//  Created by Kasajima Yasuo on 11/11/30.
//  Copyright (c) 2011 kyoto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface CameraViewController : UIViewController
{
    AVCaptureSession *_captureSession;
    AVCaptureStillImageOutput *_imageOutput;
}
@end
