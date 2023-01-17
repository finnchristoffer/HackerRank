import Foundation

func lonelyinteger(arr: [Int]) -> Int {
    var res = [Int: Int]()
    for val in arr {
        res[val] = (res[val] ?? 0) + 1
    }
    for (key, val) in res {
        if val == 1 {
            return key
        }
    }
    return 0
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let aTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let a: [Int] = aTemp.split(separator: " ").map {
    if let aItem = Int($0) {
        return aItem
    } else { fatalError("Bad input") }
}

guard a.count == n else { fatalError("Bad input") }

let result = lonelyinteger(arr: a)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
