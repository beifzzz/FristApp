//
//  ViewController.swift
//  MusicApp
//
//  Created by Arystan on 10.03.2025.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var musicURL = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: musicURL)
        let urlRequest = URLRequest(url: url!)
        
        webView.load(urlRequest)
    }


}

