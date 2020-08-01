//
//  ViewController.swift
//  SegmentMenuControllerExample
//
//  Created by Hyeonwoo Park on 2020/08/01.
//  Copyright © 2020 muzc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentMenu: HWSemgentMenuView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupLayout()
    }
    
    func setupLayout() {
        
        self.segmentMenu.font = UIFont.boldSystemFont(ofSize: 13)
        self.segmentMenu.menuInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.segmentMenu.set(menus: [
            "가나다라",
            "마바사",
            "점심",
            "저녁",
            "오후",
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "12312rsadf",
            "d아ㅣ러ㅏㅁㄴㅇㅎㄹ",
            "ㅇㄴ라ㅓㄴ아으아",
            "하아오후호"
        ]) { (index) in
            print("select index: \(index)")
        }
    }


}

