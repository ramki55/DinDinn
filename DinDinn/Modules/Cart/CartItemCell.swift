//
//  CartItemCell.swift
//  DinDinn
//
//  Created by test on 08/07/21.
//

import UIKit

class CartItemCell: UITableViewCell {
    static let reuseIdentifier = "CartItemCell"
    
    var cartItem : CartItem? {
        didSet {
            nameLabel.text = cartItem?.dish?.name
            if let price = cartItem?.dish?.price, let count = cartItem?.count {
                priceDetailsLabel.text = "$\(price)"
            }
            
            if let image = cartItem?.dish?.image {
                let url = URL(fileURLWithPath: image)
                dishImageView.sd_setImage(with: url, placeholderImage: UIImage(named: image), options: .allowInvalidSSLCertificates, completed: nil)            }
        }
    }
    
    lazy var deleteItemButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemRed.withAlphaComponent(0.7)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .white
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.layer.cornerRadius = 15
        return button
    }()

        
    private lazy var dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5

        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private lazy var priceDetailsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
            
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CartItemCell {
    
    func setupUI() {
        
//        let cardView = CardView()
        let cardView: UIView = {
            let view = UIView()
            view.applyShadow()
            return view
        }()

        contentView.addSubview(cardView)
        cardView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20))
        }
        
        let dishViewContainer:  UIView = {
            let view = UIView()
            view.backgroundColor = .white
            view.layer.cornerRadius = 20
            view.clipsToBounds = true
            return view
        }()
        
        cardView.addSubview(dishViewContainer)
        dishViewContainer.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(cardView)
        }
        
        dishViewContainer.addSubview(dishImageView)
        dishImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(dishViewContainer)
            make.left.equalTo(dishViewContainer)
            make.bottom.equalTo(dishViewContainer)
            make.width.equalTo(dishImageView.snp.height).multipliedBy(1.2)
        }
        
        let detailsView : UIView = {
            let view = UIView()
            return view
        }()
        
        dishViewContainer.addSubview(detailsView)
        detailsView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(dishViewContainer).offset(10)
            make.right.equalTo(dishViewContainer).offset(-10)
            make.bottom.equalTo(dishViewContainer).offset(-10)
            make.left.equalTo(dishImageView.snp.right).offset(10)
        }
        
        detailsView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(detailsView)
            make.left.equalTo(detailsView).offset(20)
            make.right.equalTo(detailsView).offset(-20)
        }
        
        detailsView.addSubview(deleteItemButton)
        deleteItemButton.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(detailsView).offset(-10)
            make.width.height.equalTo(30)
            make.bottom.equalTo(detailsView).offset(-13)
        }
        
        detailsView.addSubview(priceDetailsLabel)
        priceDetailsLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(detailsView)
            make.left.equalTo(detailsView).offset(20)
            make.right.equalTo(detailsView).offset(-20)
        }
    }
}
