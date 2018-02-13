//
//  AboutViewController.swift
//  Bull'sEye
//
//  Created by Егор on 11.12.2017.
//  Copyright © 2017 Егор. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var  webView: UIWebView!
    
    @IBAction func closeButton() {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            if let htmlData = try? Data(contentsOf: url) {
                let baseUrl = URL(fileURLWithPath:Bundle.main.bundlePath)
                webView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseUrl)
            }
        }
        
        webView.layer.cornerRadius = 15
        webView.layer.masksToBounds = true
    }
}
