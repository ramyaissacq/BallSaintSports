//
//  SelectionCollectionViewCell.swift
//  775775Sports
//
//  Created by Remya on 9/1/22.
//

import UIKit

class SelectionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var stack: UIStackView!
    
    
    var callSelection:(()->Void)?
    var deSelectionColor = Colors.backColor()
    var titleColor1 = Colors.backColor()
    var titleColor2 = UIColor.white
    var selectionColor = Colors.accentColor()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        let tap = UITapGestureRecognizer(target: self, action: #selector(tapCall))
//        stack.addGestureRecognizer(tap)
        handleSelection()
    }
    
    override var isSelected: Bool{
        didSet{
          handleSelection()
        }
        
    }
    
    @objc func tapCall(){
         callSelection?()
    }
    
    func handleSelection(){
        if isSelected{
            backView.backgroundColor = selectionColor
            lblTitle.textColor = titleColor1
        }
        else{
            self.backView.backgroundColor = deSelectionColor
            lblTitle.textColor = titleColor2
        }
    }

}
