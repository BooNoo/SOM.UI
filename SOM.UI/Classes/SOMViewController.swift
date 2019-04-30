//
//  SlideInMenuViewController.swift
//  CMMobileApp
//
//  Created by Vladimir on 10/01/2019.
//  Copyright © 2019 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

public class SOMViewController: UIViewController{
    
    lazy var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(removeAnimate)))
        view.alpha = 0
        return view
    }()
    
    let menu: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    lazy var menuWidth = view.frame.width * 0.8
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        menu.transform = CGAffineTransform(translationX: -menuWidth, y: 0)
        setupView()
        setupNavigation()
        gesture()
    }
    
    override public func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        let path = UIBezierPath(roundedRect: menu.bounds, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        menu.layer.mask = mask
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimate()
    }
    
    private func setupView() {
        blackView.frame = view.frame
        view.addSubview(blackView)
        view.addSubview(menu)
        
        NSLayoutConstraint.activate([
            menu.widthAnchor.constraint(equalToConstant: menuWidth),
            menu.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            menu.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            menu.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),

            ])
    }
    
    func setupNavigation() {
        navigationController?.view.backgroundColor = UIColor.clear
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.navigationBar.tintColor = .black
    }
    
    func gesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(dragMenu(_:)))
        menu.isUserInteractionEnabled = true
        menu.addGestureRecognizer(panGesture)
        
        view.isUserInteractionEnabled = true
    }
    
    @objc func dragMenu(_ panRecognizer:UIPanGestureRecognizer) {
        let translationPoint = panRecognizer.translation(in: self.menu)
        let newOffset = translationPoint.x
        
        if newOffset < 0 {
            switch panRecognizer.state {
            case .changed, .began:
                menu.transform = CGAffineTransform(translationX: newOffset, y: 0)
            case .ended:
                (newOffset > -50) ? showAnimate() : removeAnimate()
            default: break
            }
        }
    }
    
    func showAnimate() {
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: [.curveEaseInOut], animations: {
            self.blackView.alpha = 1
            self.menu.transform = CGAffineTransform.identity
        }, completion: {(_) in
            
        })
    }
    
    @objc func removeAnimate() {
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: [.curveEaseInOut], animations: {
            self.blackView.alpha = 0
            self.menu.transform = CGAffineTransform(translationX: -350, y: 0)
        }, completion: {(finished : Bool)  in
            self.close()
        })
    }
    
    @objc private func close() {
        self.dismiss(animated: false, completion: nil)
    }

}
