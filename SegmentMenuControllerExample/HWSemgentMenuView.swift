//
//  HWSemgentMenuView.swift
//  SegmentMenuControllerExample
//
//  Created by Hyeonwoo Park on 2020/08/01.
//  Copyright © 2020 muzc. All rights reserved.
//

import UIKit

class HWSemgentMenuView: UIView {

    typealias HWSemgentMenuViewMenuSelectIndexHandler = ((_ index: Int) -> Void)
    
    // [START] user config
    var font: UIFont = UIFont.systemFont(ofSize: 15)
    
    var menuColor: UIColor = UIColor.black
    var deActiveColor: UIColor = UIColor.black.withAlphaComponent(0.3)
    var indicatorColor: UIColor = UIColor.lightGray
    
    var indicatorHeight: CGFloat = 2
    var menuInset: UIEdgeInsets = .zero

    // [END] user config
    
    private var menus: [String] = []
    private var menuButtons: [UIButton] = []
    
    private var selectIndex: Int?
    private var selectActionHandler: HWSemgentMenuViewMenuSelectIndexHandler?
    
    private var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    private var subMenusView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.backgroundColor = .clear
        return view
    }()
    private lazy var IndicatorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = self.indicatorColor
        return view
    }()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.backgroundColor = .clear
        self.createdView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.reCalcView()
    }
    
    // functions
    
    private func createdView() {
        
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.subMenusView)
        self.scrollView.addSubview(self.IndicatorView)
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = true
        self.subMenusView.translatesAutoresizingMaskIntoConstraints = true
        
        self.reCalcView()
        
    }
    
    private func reCalcView() {
        self.scrollView.frame = self.bounds
        self.subMenusView.frame = CGRect(x: 0, y: 0,
                                         width: self.scrollView.contentSize.width,
                                         height: self.frame.height)
        
        for v in self.subMenusView.arrangedSubviews { v.sizeToFit() }
        
    }
    
    private func reDrawIndicator(animated: Bool = true) {
        if let index = selectIndex {
            let btn = self.menuButtons[index]
            if animated {
                UIView.animate(withDuration: 0.25) {
                    self.IndicatorView.frame = CGRect(x: btn.frame.origin.x,
                                                      y: self.frame.height - self.indicatorHeight,
                                                      width: btn.frame.size.width,
                                                      height: self.indicatorHeight)
                }
            }
            else {
                self.IndicatorView.frame = CGRect(x: btn.frame.origin.x,
                                                  y: self.frame.height - self.indicatorHeight,
                                                  width: btn.frame.size.width,
                                                  height: self.indicatorHeight)
            }
        }
    }
    
    private func reDrawButtonColors() {
        if let index = selectIndex {
            for btn in self.subMenusView.arrangedSubviews {
                guard let btn = btn as? UIButton else { continue }
                btn.setTitleColor((btn.tag == index) ? self.menuColor : self.deActiveColor, for: .normal)
            }
        }
    }
    
    private func reCreateMenuButtons() {
        for view in self.subMenusView.arrangedSubviews { view.removeFromSuperview() }
        
        self.menuButtons = []
        
        var width: CGFloat = .zero
        
        var i: Int = 0
        for menu in self.menus {
            let button = UIButton(frame: .zero)
            button.setTitle(menu, for: .normal)
            button.setTitleColor(self.deActiveColor, for: .normal)
            button.contentEdgeInsets = self.menuInset
            button.contentHorizontalAlignment = .center
            button.backgroundColor = .clear
            button.titleLabel?.font = self.font
            button.addTarget(self, action: #selector(self.selectedMenu(_:)), for: .touchUpInside)
            self.menuButtons.append(button)
            
            
            self.subMenusView.addArrangedSubview(button)
            
            button.tag = i
            button.sizeToFit()
            width += button.frame.width
            i += 1
            
        }
        
        self.scrollView.contentSize = CGSize(width: width, height: self.scrollView.frame.height)
        self.reCalcView()
        
        if self.menus.count > 0 {
            self.selectIndex = 0
            self.reDrawIndicator(animated: false)
            self.reDrawButtonColors()
        }
        
    }
    
    @objc
    private func selectedMenu(_ button: UIButton) {
        self.select(index: button.tag)
        self.selectActionHandler?(button.tag)
    }
    
}

extension HWSemgentMenuView {

    func set(menus: [String], action: HWSemgentMenuViewMenuSelectIndexHandler? = nil) {
        self.menus = menus
        self.selectActionHandler = action
        self.reCreateMenuButtons()
        self.reCalcView()
    }
    
    func select(index: Int) {
        if index > (self.menus.count - 1) {
            return
        }
        self.selectIndex = index
        self.reDrawIndicator()
        self.reDrawButtonColors()
    }

}

