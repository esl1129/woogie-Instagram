//
//  IGFeedPostGeneralTableViewCell.swift
//  woogie-Instagram
//
//  Created by 임재욱 on 2021/09/30.
//

import UIKit

/// Comments
class IGFeedPostGeneralTableViewCell: UITableViewCell {

    static let identifier = "IGFeedPostGeneralTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemOrange

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(){
        // configure the cell
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
