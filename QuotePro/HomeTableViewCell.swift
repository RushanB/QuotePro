//
//  HomeTableViewCell.swift
//  QuotePro
//
//  Created by Rushan on 2017-06-07.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    var finalQuote: FinalQuote!{
        didSet{
           cellWithQuote()
        }
    }
    
    
    func cellWithQuote(){
        quoteLabel.shadowColor = UIColor.lightGray
        quoteLabel.text = String(format: "%@", finalQuote.quote.quoteText!)
        
        authorLabel.text = String(format: "-%@", finalQuote.quote.quoteAuthor!)
        authorLabel.shadowColor = UIColor.lightGray
    }
    
    
    

}
