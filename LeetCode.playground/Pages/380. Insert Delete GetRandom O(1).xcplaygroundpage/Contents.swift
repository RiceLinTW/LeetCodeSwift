/*:
 # 380. Insert Delete GetRandom O(1)
 
 Implement the `RandomizedSet` class:

 `RandomizedSet()` Initializes the `RandomizedSet` object.\
 `bool insert(int val)` Inserts an item `val` into the set if not present. Returns `true` if the item was not present, `false` otherwise.\
 `bool remove(int val)` Removes an item `val` from the set if present. Returns `true` if the item was present, `false` otherwise.\
 `int getRandom()` Returns a random element from the current set of elements (it's guaranteed that at least one element exists when this method is called). Each element must have the same probability of being returned.\
 You must implement the functions of the class such that each function works in average `O(1)` time complexity.\

 * Callout(Example 1):
 Input\
 ["RandomizedSet", "insert", "remove", "insert", "getRandom", "remove", "insert", "getRandom"]\
 [[], [1], [2], [2], [], [1], [2], []]\
 Output\
 [null, true, false, true, 2, true, false, 2]\
 Explanation\
 RandomizedSet randomizedSet = new RandomizedSet();\
 randomizedSet.insert(1); // Inserts 1 to the set. Returns true as 1 was inserted successfully.\
 randomizedSet.remove(2); // Returns false as 2 does not exist in the set.\
 randomizedSet.insert(2); // Inserts 2 to the set, returns true. Set now contains [1,2].\
 randomizedSet.getRandom(); // getRandom() should return either 1 or 2 randomly.\
 randomizedSet.remove(1); // Removes 1 from the set, returns true. Set now contains [2].\
 randomizedSet.insert(2); // 2 was already in the set, so return false.\
 randomizedSet.getRandom(); // Since 2 is the only number in the set, getRandom() will always return 2.
  
 **Constraints:**
 - -2^31 <= val <= 23^1 - 1
 - At most 2 * 10^5 calls will be made to `insert`, `remove`, and `getRandom`.
 - There will be at least one element in the data structure when `getRandom` is called.
 */
class RandomizedSet {
  
  private var dict: [Int: Int] = [:]
  private var array: [Int] = []
  
  init() {}
    
  func insert(_ val: Int) -> Bool {
    guard dict[val] == nil else { return false }
    dict[val] = array.count
    array.append(val)
    return true
  }
    
  func remove(_ val: Int) -> Bool {
    guard
      let index = dict[val],
      let lastValue = array.last else { return false }
    if index != array.count - 1 {
      array[index] = lastValue
      dict[lastValue] = index
    }
    array.removeLast()
    dict.removeValue(forKey: val)
    return true
  }
    
  func getRandom() -> Int {
    return array.randomElement()!
  }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */

let obj = RandomizedSet()
print(obj.insert(1))
print(obj.insert(1)) 
print(obj.getRandom()) 
