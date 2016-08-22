//
//  RMDBarcodeScannerViewController.m
//  FoodHacks
//
//  Created by Rachel Dorn on 8/19/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDBarcodeScannerViewController.h"
#import <AVFoundation/AVFoundation.h>

//code from http://www.infragistics.com/community/blogs/torrey-betts/archive/2013/10/10/scanning-barcodes-with-ios-7-objective-c.aspx

@interface RMDBarcodeScannerViewController () <AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, strong) AVCaptureDevice *device;
@property (nonatomic, strong) AVCaptureDeviceInput *input;
@property (nonatomic, strong) AVCaptureMetadataOutput *output;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic, strong) UIView *highlightView;
@property (nonatomic, strong) UILabel *label;

@end


@implementation RMDBarcodeScannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.highlightView = [[UIView alloc] init];
    self.highlightView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
    self.highlightView.layer.borderColor = [UIColor greenColor].CGColor;
    self.highlightView.layer.borderWidth = 3;
    [self.view addSubview:self.highlightView];
    
    self.label = [[UILabel alloc] init];
    self.label.frame = CGRectMake(0, self.view.bounds.size.height - 40, self.view.bounds.size.width, 40);
    self.label.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    self.label.backgroundColor = [UIColor colorWithWhite:0.15 alpha:0.65];
    self.label.textColor = [UIColor whiteColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.text = @"(none)";
    [self.view addSubview:self.label];
    
    self.session = [[AVCaptureSession alloc] init];
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    
    self.input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:&error];
    if (self.input) {
        [self.session addInput:self.input];
    } else {
        NSLog(@"Error: %@", error);
    }
    
    self.output = [[AVCaptureMetadataOutput alloc] init];
    [self.output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [self.session addOutput:self.output];
    
    self.output.metadataObjectTypes = [self.output availableMetadataObjectTypes];
    
    self.previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    self.previewLayer.frame = self.view.bounds;
    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:self.previewLayer];
    
    [self.session startRunning];
    
    [self.view bringSubviewToFront:self.highlightView];
    [self.view bringSubviewToFront:self.label];
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    CGRect highlightViewRect = CGRectZero;
    AVMetadataMachineReadableCodeObject *barCodeObject;
    NSString *detectionString = nil;
    NSArray *barCodeTypes = @[AVMetadataObjectTypeUPCECode, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode39Mod43Code,
                              AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeCode128Code,
                              AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeQRCode, AVMetadataObjectTypeAztecCode];
    
    for (AVMetadataObject *metadata in metadataObjects) {
        for (NSString *type in barCodeTypes) {
            if ([metadata.type isEqualToString:type])
            {
                barCodeObject = (AVMetadataMachineReadableCodeObject *)[self.previewLayer transformedMetadataObjectForMetadataObject:(AVMetadataMachineReadableCodeObject *)metadata];
                highlightViewRect = barCodeObject.bounds;
                detectionString = [(AVMetadataMachineReadableCodeObject *)metadata stringValue];
                break;
            }
        }
        
        if (detectionString != nil)
        {
            self.label.text = detectionString;
            break;
        }
        else
            self.label.text = @"(none)";
    }
    
    self.highlightView.frame = highlightViewRect;
}

@end
