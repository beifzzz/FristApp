import UIKit

var greeting = "Hello, World"
var optionalNumber: Int? = Int("66")
var optionalNumber2: Optional<Int> = Int("42")

print(optionalNumber)
print(optionalNumber2)

//1 optional Binding !
//        let number = optionalNumber!
//

//2  nil colleasing ??
let number2 = optionalNumber ?? 0
print(number2)

//3 if let
if let n = optionalNumber {
    print(n)
} else {
    print("введите число на Оптионал")
}

// guard let ( используем в основном в функции)
func getNumber() {
    guard let numberOne = optionalNumber else {
        print("введите число на Оптиона")
              return
    }
}
getNumber()
