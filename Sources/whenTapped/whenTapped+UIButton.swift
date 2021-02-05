//
//  whenTapped+UIButton.swift
//  whenTapped
//
//  Created by Vincent Narbot on 12/2/16.
//  Copyright © 2016 Vincent Narbot. All rights reserved.
//

import UIKit

extension UIButton {
    
    public override func whenTapped(target: AnyObject, selector: Selector) {
        self.addTarget(target, action: selector, for: UIControl.Event.touchUpInside)
    }
    
    public override func whenTapped(handler: @escaping (() -> Void)) {
        let aBlockClassWrapper = ClosureWrapper(closure: handler)
        objc_setAssociatedObject(self, &AssociatedKeys.whenTappedKey, aBlockClassWrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        self.addTarget(self, action: #selector(UIButton.touchUpInside), for: UIControl.Event.touchUpInside)
    }
}
