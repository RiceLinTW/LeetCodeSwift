/*:
 # 68. Text Justification

 Given an array of strings words and a width maxWidth, format the text such that each line has exactly maxWidth characters and is fully (left and right) justified.

 You should pack your words in a greedy approach; that is, pack as many words as you can in each line. Pad extra spaces ' ' when necessary so that each line has exactly maxWidth characters.

 Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a line does not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right.

 For the last line of text, it should be left-justified, and no extra space is inserted between words.

 Note:

 A word is defined as a character sequence consisting of non-space characters only.
 Each word's length is guaranteed to be greater than 0 and not exceed maxWidth.
 The input array words contains at least one word.

 * Callout(Example 1):
 Input: words = ["This", "is", "an", "example", "of", "text", "justification."], maxWidth = 16\
 Output:\
 [\
    "This    is    an",\
    "example  of text",\
    "justification.  "\
 ]
 ---
 * Callout(Example 2):
 Input: words = ["What","must","be","acknowledgment","shall","be"], maxWidth = 16\
 Output:\
 [\
   "What   must   be",\
   "acknowledgment  ",\
   "shall be        "\
 ]\
 Explanation: Note that the last line is "shall be    " instead of "shall     be", because the last line must be left-justified instead of fully-justified.\
 Note that the second line is also left-justified because it contains only one word.
 ---
 * Callout(Example 3):
 Input: words = ["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"], maxWidth = 20\
 Output:\
 [\
   "Science  is  what we",\
   "understand      well",\
   "enough to explain to",\
   "a  computer.  Art is",\
   "everything  else  we",\
   "do                  "\
 ]

 **Constraints:**
 - 1 <= words.length <= 300
 - 1 <= words[i].length <= 20
 - words[i] consists of only English letters and symbols.
 - 1 <= maxWidth <= 100
 - words[i].length <= maxWidth
 */
class Solution {
  func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
    var result: [String] = []
    
    var lineWords: [String] = []
    var lineWidth: Int = 0

    var i = 0
    while i < words.count {
      
      let word = words[i]
      
      if lineWidth + lineWords.count + word.count > maxWidth {
        result.append(justifyLine(lineWords, lineWidth, maxWidth, false))
        lineWords = []
        lineWidth = 0
      }
      
      lineWords.append(word)
      lineWidth += word.count
      i += 1
    }
    
    result.append(justifyLine(lineWords, lineWidth, maxWidth, true))

    return result
  }
  
  func justifyLine(_ lineWords: [String], _ lineWidth: Int, _ maxWidth: Int, _ isLast: Bool) -> String {
    
    let spacesNeeded = maxWidth - lineWidth
    let gaps = lineWords.count - 1
    
    if gaps == 0 || isLast {
      return lineWords.joined(separator: " ") + String(repeating: " ", count: spacesNeeded - gaps)
    }
    
    var result = ""
    let spacedPerGap = spacesNeeded / gaps
    let extraSpaces = spacesNeeded % gaps
    
    for (index, lineWord) in lineWords.enumerated() {
      result += lineWord
      
      if index < gaps {
        result += String(repeating: " ", count: spacedPerGap + (index < extraSpaces ? 1 : 0))
      }
    }
    
    return result
  }
}

let s = Solution()
print(s.fullJustify(["This", "is", "an", "example", "of", "text", "justification."], 16))
print(s.fullJustify(["What", "must", "be", "acknowledgment", "shall", "be"], 16))
print(s.fullJustify(["Science", "is", "what", "we", "understand", "well", "enough", "to", "explain", "to", "a", "computer.", "Art", "is", "everything", "else", "we", "do"], 20))
