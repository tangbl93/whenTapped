//
//  whenTapped+UISwitch.swift
//  whenTapped
//
//  Created by Vincent Narbot on 12/2/16.
//  Copyright © 2016 Vincent Narbot. All rights reserved.
//

import UIKit

extension UISwitch {
    
    public override func whenTapped(target: AnyObject, selector: Selector) {
        self.addTarget(target, action: selector, for: UIControl.Event.valueChanged)
    }
    
    public override func whenTapped(handler: @escaping (() -> Void)) {
        let aBlockClassWrapper = ClosureWrapper(closure: handler)
        objc_setAssociatedObject(self, &AssociatedKeys.whenTappedKey, aBlockClassWrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        self.addTarget(self, action: #selector(UISwitch.touchUpInside), for: UIControl.Event.valueChanged)
    }
}
