//
//  TNSignatureViewController.swift
//  TNportfolio
//
//  Created by Prasobh Veluthakkal on 05/01/17.
//  Copyright © 2017 Focaloid. All rights reserved.
//

import UIKit

class TNSignatureViewController: UIViewController
{
    
    
    @IBOutlet weak var signimage: UIImageView!
    
    
    
    var lastPoint:CGPoint!
    
    var isSwiping:Bool!
    
    var red:CGFloat!
    
    var green:CGFloat!
    
    var blue:CGFloat!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        title = "Signature"
        
        // Do any additional setup after loading the view, typically from a nib.
        
        red   = (0.0/255.0)
        
        green = (0.0/255.0)
        
        blue  = (0.0/255.0)
        
        
        
        
        
    }
    
    @IBAction func saveImage(sender: AnyObject) {
        
        if self.signimage.image == nil{
            
            return
            
        }
        
        UIImageWriteToSavedPhotosAlbum(self.signimage.image!,self, #selector(TNSignatureViewController.image(_:withPotentialError:contextInfo:)), nil)
        
    }
    
    @IBAction func undoDrawing(sender: AnyObject) {
        
        self.signimage.image = nil
        
    }
    
    func image(image: UIImage, withPotentialError error: NSErrorPointer, contextInfo: UnsafePointer<()>) {
        
        UIAlertView(title: nil, message: "Image successfully saved to Photos library", delegate: nil, cancelButtonTitle: "OK").show()
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
    //MARK: Touch events
    
    override func touchesBegan(touches: Set<UITouch>,
                               
                               withEvent event: UIEvent?){
        
        isSwiping    = false
        
        if let touch = touches.first{
            
            lastPoint = touch.locationInView(signimage)
            
        }
        
    }
    
    
    
    override func touchesMoved(touches: Set<UITouch>,
                               
                               withEvent event: UIEvent?){
        
        
        
        isSwiping = true;
        
        if let touch = touches.first{
            
            let currentPoint = touch.locationInView(signimage)
            
            UIGraphicsBeginImageContext(self.signimage.frame.size)
            
            self.signimage.image?.drawInRect(CGRectMake(0, 0, self.signimage.frame.size.width, self.signimage.frame.size.height))
            
            CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y)
            
            CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y)
            
            CGContextSetLineCap(UIGraphicsGetCurrentContext(),CGLineCap.Round)
            
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 9.0)
            
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(),red, green, blue, 1.0)
            
            CGContextStrokePath(UIGraphicsGetCurrentContext())
            
            self.signimage.image = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            lastPoint = currentPoint
            
        }
        
    }
    
    
    
    override func touchesEnded(touches: Set<UITouch>,
                               
                               withEvent event: UIEvent?){
        
        if(!isSwiping) {
            
            // This is a single touch, draw a point
            
            UIGraphicsBeginImageContext(self.signimage.frame.size)
            
            self.signimage.image?.drawInRect(CGRectMake(0, 0, self.signimage.frame.size.width, self.signimage.frame.size.height))
            
            CGContextSetLineCap(UIGraphicsGetCurrentContext(), CGLineCap.Round)
            
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 9.0)
            
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, 1.0)
            
            CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y)
            
            CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y)
            
            CGContextStrokePath(UIGraphicsGetCurrentContext())
            
            self.signimage.image = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
        }
        
    }
    
    
    
}