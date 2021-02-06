# whenTapped

whenTapped is a Swift Library that is adding a touch event to UIView.

Inspired by: https://github.com/VincentNarbot/whenTapped

### Install

Only support SPM

###  Use

```swift
import whenTapped
```

#### Closure

```swift
view.whenTapped {
    print("view whenTapped")
}
```

#### Target-Selecter

```swift
view.whenTapped(target: self, selector: #selector(whenTapped))
```

#### [Strongify](https://github.com/krzysztofzablocki/Strongify)

``` swift
view.whenTapped(self, handler: { (context) in
    context.whenTapped()
})
```

equals to: 

``` swift
view.whenTapped { [weak self] in
    guard let strongSelf = self else { return }
    strongSelf.whenTapped()
}
```
