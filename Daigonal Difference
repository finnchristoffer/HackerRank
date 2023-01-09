import Foundation

let arr = readMatrix()


func readMatrix() -> [[Int]] {
  let n = Int(readLine()!)!
  return (0..<n).map { _ in readLine()!.split(separator: " ").compactMap { Int($0) } }
}


func diagonalDifference(arr: [[Int]]) -> Int {
  let n = arr.count
  var mainDiagonalSum = 0
  var counterDiagonalSum = 0
  for i in 0..<n {
    mainDiagonalSum += arr[i][i]
    counterDiagonalSum += arr[i][n-i-1]
  }
  return abs(mainDiagonalSum - counterDiagonalSum)
}

let result = diagonalDifference(arr: arr)
print(result)
