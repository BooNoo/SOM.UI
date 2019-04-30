//
//  SlideInMenuButton.swift
//  CMMobileApp
//
//  Created by Vladimir on 11/01/2019.
//  Copyright © 2019 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

public class SOMButton: UIButton {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        addTarget(self, action: #selector(open), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var delegate: UIViewController?
    
    @objc func open() {
        
        let vc = SOMViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.done, target: nil, action: nil)
        
        let nav = UINavigationController()
        nav.modalPresentationStyle = .overFullScreen
        nav.viewControllers = [vc]
        delegate?.present(vc, animated: false, completion: nil)

    }
}
