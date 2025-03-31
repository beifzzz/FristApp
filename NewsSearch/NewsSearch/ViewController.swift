//
//  ViewController.swift
//  NewsSearch
//
//  Created by Arystan on 31.03.2025.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    var newsURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: newsURL) {
            webView.load(URLRequest(url: url))
        }
    }
    
    
}

