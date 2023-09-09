//
//  ViewController.swift
//  SampleEvaluateScript
//
//  Created by Dexter Ramos on 9/9/23.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    private lazy var webView: WKWebView = {
        let config = WKWebViewConfiguration()
        let webView = WKWebView(frame: view.bounds, configuration: config)
        webView.navigationDelegate = self
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        
        // Load url
        let url = URL(string: "file:///Users/dexter/Desktop/knowledge-base-resources-swift-series-/sampleWebPage/index.html")
        let request = URLRequest(url: url!)
        webView.load(request)
    }

}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.body.style.backgroundColor = 'orange'")
    }
}
