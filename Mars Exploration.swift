import Foundation

/*
 * Complete the 'marsExploration' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts STRING s as parameter.
 */

func marsExploration(s: String) -> Int {
    
    var count = 0
    
    for i in stride(from: 0, to: s.count, by: 3) {
        if s[s.index(s.startIndex, offsetBy: i)] != "S" {
            count += 1
        }
        if s[s.index(s.startIndex, offsetBy: i+1)] != "O" {
            count += 1
        }
        if s[s.index(s.startIndex, offsetBy: i+2)] != "S" {
            count += 1
        }
    }
    return count
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let s = readLine() else { fatalError("Bad input") }

let result = marsExploration(s: s)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
