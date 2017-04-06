//
//  TNResumeViewController.swift
//  TNportfolio
//
//  Created by Prasobh Veluthakkal on 09/01/17.
//  Copyright © 2017 Focaloid. All rights reserved.
//

import UIKit

class TNResumeViewController: UIViewController {

    @IBOutlet weak var resumeWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSBundle.mainBundle().URLForResource("", withExtension: "pdf")
        
        if let url = url {
            let webView = UIWebView(frame: self.view.frame)
            let urlRequest = NSURLRequest(URL: url)
            webView.loadRequest(urlRequest)
            view.addSubview(webView)
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
