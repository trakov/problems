protocol MountainArray {
	func get(_ index: Int) -> Int
	func length() -> Int
}

class MountainArrayImpl: MountainArray {
	private var array: [Int]
	init(_ array: [Int]) {
		self.array = array
	}
	func get(_ index: Int) -> Int {
		return array[index]
	}
	func length() -> Int {
		return array.count
	}
}

class FindInMountainArray {
	func findInMountainArray(_ target: Int, _ arr: MountainArray) -> Int {
		let n = arr.length()
		var left = 0
		var right = n - 1
		while left < right {
			let mid = left + (right - left) / 2
			if mid + 1 < n && arr.get(mid + 1) > arr.get(mid) {
				left = mid + 1
			} else if mid > 0 && arr.get(mid) < arr.get(mid - 1) {
				right = mid - 1
			} else {
				left = mid + 1
			}
		}
		func binarySearch(i: Int, j: Int, asc: Bool = true) -> Int? {
			var l = i
			var r = j
			while l <= r {
				let mid = l + (r - l) / 2
				if arr.get(mid) < target {
					if asc { l = mid + 1 } else { r = mid - 1 }
				} else if arr.get(mid) > target {
					if asc { r = mid - 1 } else { l = mid + 1 }
				} else {
					return mid
				}
			}
			return nil
		}
		return binarySearch(i: 0, j: left) ?? binarySearch(i: left, j: n - 1, asc: false) ?? -1
	}
	
	func tests() {
		print(findInMountainArray(3, MountainArrayImpl([1,2,3,4,5,3,1]))) // 2
		print(findInMountainArray(3, MountainArrayImpl([0,1,2,4,2,1]))) // -1
		print(findInMountainArray(2, MountainArrayImpl([1,2,3,4,5,3,1]))) // 1
		print(findInMountainArray(0, MountainArrayImpl([1,5,2]))) // -1
	}
}

