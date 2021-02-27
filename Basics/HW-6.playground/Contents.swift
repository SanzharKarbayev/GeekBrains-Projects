import Cocoa

struct Queue<T: Numeric> {
    private var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        guard elements.count > 0 else {
            return nil
        }
        return elements.remove(at: 0)
    }
    
    mutating func filter(predicate: (T) -> Bool) {
        var tmpArray: [T] = []
        var i = 0, j = 0
        var element: T
        while i < elements.count {
            element = elements[i]
            if !predicate(element) {
                tmpArray.append(elements.remove(at: i))
                j += 1
                continue
            }
            j += 1
            i += 1
        }
        elements.append(contentsOf: tmpArray)
    }
    
    subscript(index: Int) -> T? {
        guard elements.count > index else {
            return nil
        }
        return elements[index]
    }
}

let even: (Int) -> Bool = { (element: Int) -> Bool in
    return element % 2 == 0
}

let odd: (Int) -> Bool = { (element: Int) -> Bool in
    return element % 2 != 0
}

var intQueue = Queue<Int>()
intQueue.push(10)
intQueue.push(11)
intQueue.push(12)
intQueue.push(13)
intQueue.push(14)
intQueue.push(15)
intQueue.push(16)
intQueue.filter(predicate: even)
intQueue.pop()
intQueue.pop()
intQueue.pop()
intQueue.pop()
intQueue.pop()
intQueue.pop()
intQueue.pop()
intQueue.pop()
intQueue.push(10)
intQueue.push(11)
intQueue.push(12)
intQueue.push(13)
intQueue.push(14)
intQueue.push(15)
intQueue.push(16)
intQueue.filter(predicate: odd)
intQueue.pop()
intQueue.pop()
intQueue.pop()
intQueue.pop()
intQueue.pop()
intQueue.pop()
intQueue.pop()
intQueue.pop()

