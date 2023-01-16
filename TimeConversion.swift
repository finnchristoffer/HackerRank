import Foundation

let input = readLine()!

func timeConversion(input: String) -> String {
     let time = input.suffix(8)
     let hour = Int(input.prefix(2))
     let isPM = input.hasSuffix("PM")
     var hour24 = hour!
    if isPM && hour != 12 {
        hour24 += 12
    } else if !isPM && hour == 12 {
        hour24 = 0
    }
    return String(format: "%02d", hour24) + time.dropLast(2)
}

print(timeConversion(input: input))
