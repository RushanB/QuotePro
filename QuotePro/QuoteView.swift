//
//  QuoteView.swift
//  QuotePro
//
//  Created by Rushan on 2017-06-07.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

import UIKit

class QuoteView: UIView {
    
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    //helper method to add quote to the view
    func viewWithQuote(quote:Quote) -> Void{
        label.text = FinalQuote.quote.quoteText
        label.shadowColor = UIColor.lightGray
        
        label.text = FinalQuote.quote.quoteAuthor
        label.shadowColor = UIColor.lightGray
    }
    
}

