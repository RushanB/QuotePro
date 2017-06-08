//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Rushan on 2017-06-07.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

import UIKit
//assign protocol method
protocol QuoteBuilderDelegate{
    func saveQuote(saveQuote: FinalQuote)
}

class QuoteBuilderViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var quoteViewFrame: UIView!
    
    var delegate: QuoteBuilderDelegate!
    var quoteView: QuoteView!
    var finalQuote: FinalQuote = FinalQuote()
    
    //MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //QuoteView xib
        quoteView = Bundle.main.loadNibNamed("QuoteView", owner: nil, options: nil)?.first! as? QuoteView
        quoteView?.frame.size = quoteViewFrame.frame.size
        quoteViewFrame.addSubview(quoteView!)
        
        
        
        addView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Helper methods
    func addView(){
        //if not nil
        if((finalQuote.quote != nil) && (finalQuote.photo != nil)){
            DispatchQueue.main.async {
                self.quoteView.viewWithQuote(finalQuote: self.finalQuote)
            }
        }
    }
    
    
    //MARK: Actions
    @IBAction func randQuoteTapped(_ sender: UIButton) {
        let randQuote = FetchQuote()
        randQuote.fetchQuote{(quote: Quote) in
            self.finalQuote.quote = quote
            self.addView()
        }
        
    }
    
    @IBAction func randPhotoTapped(_ sender: UIButton) {
        let randPhoto = FetchPhoto()
        randPhoto.fetchPhoto{(photo: Photo) in
            
            self.finalQuote.photo = photo
            self.addView()
        }
    }
    
    @IBAction func shareTapped(_ sender: UIButton) {
        //animate
        UIGraphicsBeginImageContextWithOptions(quoteView.bounds.size, true, 0)
        quoteView.drawHierarchy(in: quoteView.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //set activity view controller
        let imagesToShare = [image] //photo arrays
        let activityViewController = UIActivityViewController(activityItems: imagesToShare, applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    //nav bar
    @IBAction func saveTapped(_ sender: Any) {
        delegate.saveQuote(saveQuote: self.finalQuote)  //call delegate save function
        
        navigationController!.popViewController(animated: true)
    }
    
}
