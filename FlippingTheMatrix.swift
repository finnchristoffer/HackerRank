import Foundation


/*
 * Complete the 'flippingMatrix' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts 2D_INTEGER_ARRAY matrix as parameter.
 */

func flippingMatrix(matrix: [[Int]]) -> Int {
    
    let n = matrix.count
    var s = 0
    
    for i in 0..<(n/2) {
        for j in 0..<(n/2) {
            s += max(matrix[i][j], matrix[i][n-j-1], matrix[n-i-1][j], matrix[n-i-1][n-j-1])
        }
    }
    
    return s
}
let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let q = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for qItr in 1...q {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    var matrix = [[Int]]()

    for _ in 1...2 * n {
        guard let matrixRowTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

        let matrixRow: [Int] = matrixRowTemp.split(separator: " ").map {
            if let matrixItem = Int($0) {
                return matrixItem
            } else { fatalError("Bad input") }
        }

        guard matrixRow.count == 2 * n else { fatalError("Bad input") }

        matrix.append(matrixRow)
    }

    guard matrix.count == 2 * n else { fatalError("Bad input") }

    let result = flippingMatrix(matrix: matrix)

    fileHandle.write(String(result).data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
