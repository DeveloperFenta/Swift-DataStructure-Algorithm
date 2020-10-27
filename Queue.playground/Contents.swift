public struct Queue<T> {
    fileprivate var array = [T?]()
    fileprivate var head = 0
    
    public var isEmpty: Bool { return count == 0}
    
    public var count: Int { return array.count - head }
    
    public var peek: T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        let usageRate = Double(head) / Double(array.count)
        
        // If more than 25% of the array is unused and there are more than 50 array elements ...
        // Trim
        if array.count > 50 && usageRate > 0.25 {
            array.removeFirst(head)
            head = 0
            
            print("Queue has been trim")
        }
        
        return element
    }
}

// Queue Usage Examples
var intQueue = Queue<Int>()
var strQueue = Queue<String>()

var intData = [0, 1, 2, 3, 4]
var strData = ["가", "나", "다", "라", "마"]

for data in intData { intQueue.enqueue(data) }
for data in strData { strQueue.enqueue(data) }

print("---- Int Queue Dequeue Result ----")
for _ in 0 ..< intQueue.count {
    guard let data = intQueue.dequeue() else { break }
    print("\(data)")
}

print("---- String Queue Dequeue Result ----")
for _ in 0 ..< strQueue.count {
    guard let data = strQueue.dequeue() else { break }
    print("\(data)")
}
