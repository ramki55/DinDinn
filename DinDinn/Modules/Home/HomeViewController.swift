//
//  HomeViewController.swift
//  DinDinn
//
//  Created by test on 06/07/21.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxGesture

final class HomeViewController: UIViewController {
        
    var presenter: HomePresenterInterface!
        
    private lazy var promotionsView: InstructionsView = {
        let view = InstructionsView()
        view.presenter = self.presenter
        return view
    }()
    
    private lazy var foodMenuView : FoodMenuView = {
        let view = FoodMenuView(presenter: presenter)
        view.presenter = self.presenter
        return view
    }()
    
    private let disposeBag = DisposeBag()
    
    private let topOffsetCollapsed : CGFloat = 0.7 * UIScreen.main.bounds.height
    
    private let topOffsetExpended : CGFloat = 0
    
    private lazy var topOffset = topOffsetCollapsed
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRx()
        setupUI()
        setupGestures()
    }
}

extension HomeViewController: HomeViewInterface {
}

private extension HomeViewController {
    
    func setupRx() {
//        let addToCartTapped = PublishSubject<Dish>()
//        
//        let output = Home.ViewOutput(openCartTapped: openCartButton.rx.tap.asObservable(),
//                                     addToCartTapped: addToCartTapped)
    }
    
    func setupUI() {
        setupNavigationBar()
        
        view.addSubview(promotionsView)
        promotionsView.snp.makeConstraints { (make) -> Void in
            make.top.left.right.equalTo(view)
            make.height.equalTo(UIScreen.main.bounds.height*0.8)
        }
        
        view.addSubview(foodMenuView)
        foodMenuView.snp.makeConstraints { (make) -> Void in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(self.topOffset)
        }
        
    }
    
    func setupGestures() {
        let panGesture = foodMenuView.rx
            .panGesture(configuration: { gestureRecognizer, delegate in
                delegate.simultaneousRecognitionPolicy = .custom { gestureRecognizer, otherGestureRecognizer in
                    return  !(otherGestureRecognizer.view?.isKind(of: UITableView.self) ?? false)
                }
            })
            .share()
        
        panGesture
            .when(.began, .changed)
            .asTranslation()
            .map { (translation, _) -> CGFloat in
                self.topOffset += translation.y/10
                return self.topOffset
            }
            .filter { [unowned self] offset in
                offset <= self.topOffsetCollapsed &&
                    offset >= self.topOffsetExpended
            }
            .subscribe(onNext: { [unowned self] (offset) in
                self.foodMenuView.snp.remakeConstraints { (make) -> Void in
                    make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(offset)
                    make.left.right.bottom.equalTo(self.view)
                }
            })
            .disposed(by: disposeBag)
        
        panGesture
            .when(.ended)
            .map({ [unowned self] _ -> CGFloat in
                self.topOffset = self.topOffset > self.topOffsetCollapsed/2
                    ? self.topOffsetCollapsed
                    : self.topOffsetExpended
                return self.topOffset
            })
            .subscribe(onNext: { [unowned self] offset in
                print("DEBUG: Panning ended ...\(self.topOffset)")
                UIView.animate(withDuration: 0.1, animations: {
                    self.foodMenuView.snp.remakeConstraints { (make) -> Void in
                        make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(offset)
                        make.left.right.bottom.equalTo(self.view)
                    }
                    self.view.layoutIfNeeded()
                })
            })
            .disposed(by: disposeBag)
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
}
