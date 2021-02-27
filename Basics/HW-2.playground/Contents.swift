import UIKit

//Exercise 1
func even(number: Int) -> Bool {
    if number % 2 == 0 {
        return true
    } else {
        return false
    }
}
var num = 35
//print("\(num) is even number? \nAnswer: \(even(number: num))")

//Exercise 2
func remainderFunc(number: Int) -> Bool {
    if number % 3 == 0 {
        return true
    } else {
        return false
    }
}
//print("\(num) have any remainder? \nAnswer: \(even(number: num))")

//Exercise 3
var array = [Int](1...100)          //Очень долго не мог понять как инициализировать массив из порядковых чисел
                                    //сначала пытался сделать var array = 1...100. ошибки именно эта строчка не вызывало, но как только я пытался обратиться к элементам массива через индекс, вызвывало ошибку. как можно было бы исправить эту ошибку, не меняя array = 1...100?
                                    //Cannot convert value of type 'Int' to expected argument type 'ClosedRange<Int>.Index'
                                    //я так понял существует множетсо разных способов инициализации разных переменных?
                                    //и еще можете обьяснить что такое Array<тип переменной>? в чем отличие от того, как сделал я?

//Exercise 4
var i = 0
while i < array.count {
    if even(number: array[i]) || remainderFunc(number: array[i]) {
        array.remove(at: i)
        continue
    }
    i += 1
}
//print(array)

//Exercise 5
func fibo(number: Int) -> [UInt64] {
    var fiboArray = [UInt64]()
    var fibo1: UInt64 = 1, fibo2: UInt64 = 2
    if number <= 2 {
        if number == 1 {
            fiboArray = [1]
        } else {
            fiboArray = [1, 2]
        }
    } else {
        fiboArray.append(contentsOf: 1...2)
        for _ in 2..<number {
            fiboArray.append(fibo1 + fibo2)
            let tmp = fibo1
            fibo1 = fibo2
            fibo2 = fibo1 + tmp
        }
    }
    return fiboArray
}
var newArray = [UInt64]()
newArray.append(contentsOf: fibo(number: 92))   //Если я вообще правильно понял условие, то нужно было 100 чисел Фибоначчи, а это же огромные числа
print(newArray)                                 //Максимальное число которого я добился. не уверен что простымы методами можно хранить числа больше
                                                //Если такие есть, напишите пожалуйста здесь

//Exercise 6
func isPrime(n: Int) -> Bool {
    return n > 1 && !(2..<n).contains {n % $0 == 0}         //Можете обьяснить почему при использовании contains сначала нам дают круглые скобки с возможносью передачи параметров как для фунуций. почему мы должны использовать {}?
}
var lastArray = [Int]()
for i in 1...541 {                              //получается ровно 100 простых чисел
    if isPrime(n: i) {
        lastArray.append(i)
    }
}

