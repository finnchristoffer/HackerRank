import Foundation

let arr = readLine()!.split(separator: " ").map{ Int($0)! }

func miniMaxSum(arr: [Int]) -> Void {
    var minSum = Int.max
    var maxSum = Int.min

    for i in 0..<arr.count {
        var currentSum = 0
        for j in 0..<arr.count {
            if i != j {
                currentSum += arr[j]
            }
        }
        minSum = min(minSum, currentSum)
        maxSum = max(maxSum, currentSum)
    }

    print("\(minSum) \(maxSum)")
}

miniMaxSum(arr: arr)
