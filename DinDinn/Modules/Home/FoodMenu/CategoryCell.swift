//
//  CategoryCell.swift
//  DinDinn
//
//  Created by test on 06/07/21.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class CategoryCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CategoryCell"
    
    var category: Category? {
        didSet {
            categoryNameLabel.text = category?.name
        }
    }
    
    override var isSelected: Bool {
        didSet {
            categoryNameLabel.textColor = isSelected ? .black : .lightGray
            selectBarIndicator.isHidden = !isSelected
        }
    }
    
    private lazy var categoryNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Category name"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var selectBarIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 1
        view.isHidden = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with category: Category) {
        self.category = category
    }
}

extension CategoryCell {
    func setupUI() {
        
        contentView.addSubview(categoryNameLabel)
        categoryNameLabel.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
        }
        
        contentView.addSubview(selectBarIndicator)
        selectBarIndicator.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.bottom.equalTo(self)
            make.height.equalTo(2)

        }
        
    }
}
