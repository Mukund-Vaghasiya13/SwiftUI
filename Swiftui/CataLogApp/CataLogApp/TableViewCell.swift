//
//  TableViewCell.swift
//  CataLogApp
//
//  Created by Mukund vaghasiya  on 02/06/23.
//

import UIKit
import WebKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var WebViewwidget: WKWebView!
    
    @IBOutlet weak var ProductName: UILabel!
    
    @IBOutlet weak var Price: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
