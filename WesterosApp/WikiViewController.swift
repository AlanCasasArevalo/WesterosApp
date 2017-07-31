//
//  WikiViewController.swift
//  WesterosApp
//
//  Created by Alan Casas on 18/7/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController {
    
    @IBOutlet weak var browserView: UIWebView!
    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    private let _model:House
    
    init(model: House){
        self._model = model
        super.init(nibName: nil, bundle: nil)
        title = "Wiki de GOT"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.syncViewWithModel(houseURL: _model.wikiURL)
    
        let center:NotificationCenter = NotificationCenter.default
        center.addObserver(self, selector: #selector(houseDidChange) , name: NSNotification.Name(rawValue: notificationName), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
        
    }
    
    @objc func houseDidChange(notification: Notification) {
        
        let notificationDict = notification.userInfo
        
        if let newHouse = notificationDict![houseKey] as? House {
            syncViewWithModel(houseURL: newHouse.wikiURL)
        }

    }
    
}

extension WikiViewController :  UIWebViewDelegate{
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        activityView.stopAnimating()
        activityView.isHidden = true
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if (navigationType == .linkClicked) ||
            (navigationType == .formSubmitted) {
            return false
        }else{
            return true
        }
    }
}

extension WikiViewController{

    func syncViewWithModel(houseURL: URL){
        
        activityView.isHidden = false
        activityView.startAnimating()
        browserView.delegate = self
        browserView.loadRequest(URLRequest(url: houseURL))
        
    }

}
































