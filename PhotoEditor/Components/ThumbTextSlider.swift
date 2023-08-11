//
//  ThumbTextSlider.swift
//  PhotoEditor
//
//  Created by Michael Ghevondyan on 10.08.23.
//

import UIKit

class ThumbTextSlider: UISlider {
    
    private var thumbTextLabel: UILabel = UILabel()
    
    private var thumbFrame: CGRect {
        return thumbRect(forBounds: bounds, trackRect: trackRect(forBounds: bounds), value: value)
    }
    
    private lazy var thumbView: UIView = {
        let thumb = UIView()
        return thumb
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        thumbTextLabel.frame = CGRect(x: thumbFrame.origin.x, y: thumbFrame.maxY - 5, width: thumbFrame.size.width, height: 30)
        self.setValue()
    }
    
    private func setValue() {
        thumbTextLabel.text = String(format: "%0.2f", self.value)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(thumbTextLabel)
        thumbTextLabel.textAlignment = .center
        thumbTextLabel.textColor = .blue
        thumbTextLabel.layer.zPosition = layer.zPosition + 1
        thumbTextLabel.adjustsFontSizeToFitWidth = true
    }
}
