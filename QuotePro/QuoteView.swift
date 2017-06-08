//
//  QuoteView.swift
//  QuotePro
//
//  Created by Rushan on 2017-06-07.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

import UIKit
import Foundation

class QuoteView: UIView {

    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    //helper method to add quote to the view
    func viewWithQuote(finalQuote:FinalQuote) -> Void{
        
        photoView.image = finalQuote.photo.photo
        
        quoteLabel.text = finalQuote.quote.quoteText
        quoteLabel.shadowColor = UIColor.lightGray
        
        authorLabel.text = finalQuote.quote.quoteAuthor
        authorLabel.shadowColor = UIColor.lightGray
    }
    
}

