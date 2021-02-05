//
//  whenTapped+UIView.swift
//  whenTapped
//
//  Created by vnarbot on 4/11/17.
//  Copyright © 2017 Vincent Narbot. All rights reserved.
//

import UIKit
import Strongify

extension UIView {
    
    struct AssociatedKeys {
        static var whenTappedKey   = "whenTappedKey"
    }
}

extension UIView {
    
    // MARK: - whenTapped by target
    @objc public func whenTapped(target:AnyObject, selector: Selector) {
        let tapGr = UITapGestureRecognizer(target:target, action:selector)
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGr)
    }
    
    // MARK: - whenTapped by clousure
    @objc public func whenTapped(handler: @escaping (() -> Void)) {
        let aBlockClassWrapper = ClosureWrapper(closure: handler)
        objc_setAssociatedObject(self, &AssociatedKeys.whenTappedKey, aBlockClassWrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        let tapGr = UITapGestureRecognizer(target:self, action:#selector(UIView.touchUpInside))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGr)
    }
    
    @objc func touchUpInside(){
        let actionBlockAnyObject = objc_getAssociatedObject(self, &AssociatedKeys.whenTappedKey) as? ClosureWrapper
        actionBlockAnyObject?.closure?()
    }
    
    // MARK: - whenTapped by strongify
    public func whenTapped<T: AnyObject>(_ context: T?, handler: @escaping ((T) -> Void)) {
        self.whenTapped(handler: strongify(weak: context, closure: { (context) in
            handler(context)
        }))
    }
}
