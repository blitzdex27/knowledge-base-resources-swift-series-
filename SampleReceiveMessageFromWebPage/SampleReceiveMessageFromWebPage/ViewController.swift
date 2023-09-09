//
//  ViewController.swift
//  SampleReceiveMessageFromWebPage
//
//  Created by Dexter Ramos on 9/10/23.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    private lazy var webView: WKWebView = {
        let contentController = WKUserContentController()
        contentController.add(self, name: "headerInfo")
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        webView.frame = view.bounds
        
        let url = URL(string: "file:///Users/dexter/Desktop/knowledge-base-resources-swift-series-/SampleWebpage/index.html")
        let request = URLRequest(url: url!)
        webView.load(request)
    }


}

extension ViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        if message.name == "headerInfo" {
            print(message.body)
        }
    }
}
