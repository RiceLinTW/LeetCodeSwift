/*:
 # 155. Min Stack
 
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

 Implement the `MinStack` class:

 MinStack() initializes the stack object.\
 void push(int val) pushes the element val onto the stack.\
 void pop() removes the element on the top of the stack.\
 int top() gets the top element of the stack.\
 int getMin() retrieves the minimum element in the stack.\
 You must implement a solution with O(1) time complexity for each function.

 * Callout(Example 1):
 Input\
 ["MinStack","push","push","push","getMin","pop","top","getMin"]\
 [[],[-2],[0],[-3],[],[],[],[]]\
 Output\
 [null,null,null,null,-3,null,0,-2]\
 Explanation\
 MinStack minStack = new MinStack();\
 minStack.push(-2);\
 minStack.push(0);\
 minStack.push(-3);\
 minStack.getMin(); // return -3\
 minStack.pop();\
 minStack.top();    // return 0\
 minStack.getMin(); // return -2

 **Constraints:**
 - -2^31 <= val <= 2^31 - 1
 - Methods pop, top and getMin operations will always be called on non-empty stacks.
 - At most 3 * 104 calls will be made to push, pop, top, and getMin.
 */

class MinStack {
  private var stack = [Int]()
  private var minStack = [Int]()

  init() {}
    
  func push(_ val: Int) {
    stack.append(val)
    if let lastMin = minStack.last {
      minStack.append(min(lastMin, val))
    } else {
      minStack.append(val)
    }
  }
    
  func pop() {
    stack.removeLast()
    minStack.removeLast()
  }
    
  func top() -> Int {
    stack.last!
  }
  
  func getMin() -> Int {
    minStack.last!
  }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

let minStack = MinStack()
minStack.push(-2)
minStack.push(0)
minStack.push(-3)
print(minStack.getMin())  
minStack.pop()
print(minStack.top())    
print(minStack.getMin())
