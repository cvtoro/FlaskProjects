//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Cecilia  Villatoro on 1/25/16.
//  Copyright © 2016 Cecilia  Villatoro. All rights reserved.
//

import Foundation
import WebKit

class WebViewController: UIViewController{
    
    var webView : WKWebView!
    override func loadView() {
        webView = WKWebView()
        
        self.view = webView
 
        

        
        

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded web")
        
        var req : NSURLRequest!
        
        let url = NSURL(string:"https://www.bignerdranch.com")
        req = NSURLRequest(URL: url!)

        webView.loadRequest(req)
    }
    
}