public struct Deque<T> {
    private var array: [T?]
    private var head: Int
    private var capacity: Int
    private let originalCapacity: Int
    
    public init(_ capacity: Int = 10) {
        self.capacity = max(capacity, 1)
        originalCapacity = self.capacity
        array = [T?](repeating: nil, count: capacity)
        head = capacity
    }
    
    public var isEmpty: Bool {
        return array.count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func enqueueFront(_ element: T) {
        if head == 0 {
            capacity *= 2
            
            let emptySpace = [T?](repeating: nil, count: capacity)
            array.insert(contentsOf: emptySpace, at: 0)
            
            head = capacity
        }
        
        head -= 1
        array[head] = element
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        // If the head has advanced more to the right than twice the capacity ...
        // Trim
        if capacity >= originalCapacity && head >= capacity * 2 {
            let amountToRemove = capacity + capacity / 2
            array.removeFirst(amountToRemove)
            head -= amountToRemove
            capacity /= 2
        }
        
        return element
    }
    
    public mutating func dequeueBack() -> T? {
        if isEmpty == true {
            return nil
        } else {
            return array.removeLast()
        }
    }
    
    public func peekFront() -> T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
    
    public func peekBack() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.last!
        }
    }
}


// Deque Usage Examples
var intDeque = Deque<Int>()
var intData = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]

for data in intData { intDeque.enqueue(data) }
print("---- Int Deque (enqueue) Dequeue Result ----")
for _ in 0 ..< intDeque.count {
    guard let data = intDeque.dequeue() else { break }
    print("\(data)")
}

for data in intData { intDeque.enqueue(data) }
print("---- Int Deque (enqueue) Dequeue Back Result ----")
for _ in 0 ..< intDeque.count {
    guard let data = intDeque.dequeueBack() else { break }
    print("\(data)")
}

for data in intData { intDeque.enqueueFront(data) }
print("---- Int Deque (enqueue Front) Dequeue Result ----")
for _ in 0 ..< intDeque.count {
    guard let data = intDeque.dequeue() else { break }
    print("\(data)")
}

for data in intData { intDeque.enqueueFront(data) }
print("---- Int Deque (enqueue Front) Dequeue Back Result ----")
for _ in 0 ..< intDeque.count {
    guard let data = intDeque.dequeueBack() else { break }
    print("\(data)")
}
