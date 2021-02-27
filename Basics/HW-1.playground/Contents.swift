import UIKit

//Exercise 1
let a = 9.0
let b = 16.0
let c = 2.0
let D = pow(b, 2) - (4 * a * c)
let x1 = (-b - sqrt(D)) / (2 * a)
let x2 = (-b + sqrt(D)) / (2 * a)
if ((a * pow(x1, 2) + b * x1 + c) == 0) {
    print("x1 is rigth")
}
if ((a * pow(x2, 2) + b * x2 + c) == 0) {
    print("x2 is rigth")
}

//Exercise 2
let cathetusA = 4.0
let cathetusB = 7.0
let hypotenuse = sqrt(pow(cathetusA, 2) + pow(cathetusB, 2))
let perimeter = hypotenuse + cathetusB + cathetusA
let square = 1/2 * cathetusA * cathetusB

//Exercise 3
let persent = 10;
var deposit = 1_000_000.0
for i in 1...5 {
    print("За ", i, " год, накопилась ", (deposit * (Double(persent) / 100)))
    deposit = deposit + (deposit * (Double(persent) / 100))
    print("\nОбщая сумма: ", deposit)
}
