//
//  ViewController.swift
//  GeekBrains App
//
//  Created by Sanzhar on 25.02.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    private let networkManager: NetworkManager = NetworkManager()

    @IBOutlet weak var webview: WKWebView! {
        didSet {
            webview.navigationDelegate = self
        }
    }
    
    var urlComponents = URLComponents()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setDara()
    }
    
    func setDara() {
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [URLQueryItem(name: "client_id", value: "7772690"),
                                    URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                                    URLQueryItem(name: "display", value: "mobile"),
                                    URLQueryItem(name: "scope", value: "262150"),
                                    URLQueryItem(name: "response_type", value: "token"),
                                    ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webview.load(request)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
                    .components(separatedBy: "&")
                    .map { $0.components(separatedBy: "=") }
                    .reduce([String: String]()) { result, param in
                        var dict = result
                        let key = param[0]
                        let value = param[1]
                        dict[key] = value
                        return dict
                }
                
        let token = params["access_token"]
        Session.instace.token = token!
        
        decisionHandler(.cancel)
    }
}
