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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.syncViewWithModel()
    }
    
    func syncViewWithModel(){
        
        activityView.isHidden = false
        activityView.startAnimating()
        title = _model.name
        browserView.delegate = self
        browserView.loadRequest(URLRequest(url: _model.wikiURL))
        
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


































