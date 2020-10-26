public struct Stack<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool { array.isEmpty }
    
    public var count: Int { array.count }
    
    public var peek: T? { return array.last }
    
    public mutating func push(_ element: T) { array.append(element) }
    
    public mutating func pop() -> T? { array.popLast() }
}

// Stack Usage Examples
var intStack = Stack<Int>()
var strStack = Stack<String>()

var intData = [0, 1, 2, 3, 4]
var strData = ["가", "나", "다", "라", "마"]

for data in intData { intStack.push(data) }
for data in strData { strStack.push(data) }

print("---- Int Stack Pop Result ----")
for _ in 0 ..< intStack.count {
    guard let data = intStack.pop() else { break }
    print("\(data)")
}

print("---- String Stack Pop Result ----")
for _ in 0 ..< strStack.count {
    guard let data = strStack.pop() else { break }
    print("\(data)")
}
