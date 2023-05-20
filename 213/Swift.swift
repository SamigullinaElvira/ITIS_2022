# Swift

1. let, var

class MyClass {
    var foo: Int = 0
    var bar: Int = 0
}

let myClass = MyClass()

2. value/reference

ref — class, func
val — struct, enum

[foo _ _ _] [bar _ _ _] _ _ _ _ _ _

3. Copy on write

var a = 1
var b = a
// a = 2
// print(b)

var a = [ 1, 2, 3 ]
var b = a

struct Array<T> {
    var capacity: Int
    var buffer: ... (reference type)
}

// isKnownUniquelyReferenced(_:)

4. Memory management (например, swift vs java).
0x0000000000000000

5. open/public/internal/fileprivate/private
open class MyViewController: UIViewController {}

6. final / static / lazy
7. protocol / generic / extension / associatedtype / typealias

protocol Foo {
    func bar()
}

extension Foo {
    func foo() { ... }

    func fooBar() { print("foobar") }
}

class MyFoo: Foo {
    func bar() {}

    func fooBar() { print("custom foobar") }
}

let f = MyFoo()
f.fooBar()

8. Method dispatch

func foo() -> Int { 42 }

9. Optional
10. if / for / while / switch / guard
11. if case .asdf = foo, if let a = b
12. [capture list]
13. Computed / stored property
14. @escaping

UIKit
1. Иерархия классов UI... -> NSObject
2. Responder chain / hitTest / pointInside
3. Жизненный цикл UIView / UIViewController / Application
4. RunLoop / Timer
5. Layout (storyboard / autolayout / frame layout)
6. Animations
7. CALayer / UIView
8. UITableView / UICollectionView / indexPath
9. Path (CGPath / UIBezierPath)
10. Навигация (Navigation, Tab Bar, Modal controllers)
11. UICollectionViewCompositionalLayout
12. Gesture recognizer
13. UIControlEvents (selector, UIAction)
14. @objc / @IBAction / @IBOutlet
15. UIStackView
16. bounds / frame

Concurrency, GCD
1. GCD (queue, group, work item)
2. OperationQueue
3. async / await / actor (MainActor) / Task

Network / Storage
1. URLSession
2. Codables
3. FileManager
4. UserDefaults
5. Core Data (core data stack, data model, fetch request, sort descriptor, predicate)

Архитектура
1. Паттерны разработки (MVX, Coordinator)
2. SOLID

SwiftUI
1. Observable object, observed object
2. State / Binding
3. @Published
4. @Environment, @EnvironmentObject
5. NavigationPath, NavigationLink, .navigationDestination

Other
1. Тесты, пирамида тестирования, преимущество тех или иных тестов, XCTestCase
2. SPM, что, для чего, зачем
3. Пуши, deep links
4. Combine (publishers / subjects)