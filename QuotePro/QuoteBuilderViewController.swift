//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Rushan on 2017-06-07.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

import UIKit

class QuoteBuilderViewController: UIViewController {
    
    
    
    
    var quoteView: QuoteView?
    
    var quote:Quote?
    var photo:Photo?
    var image:UIImage?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    static func snapshot(view: UIView) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
