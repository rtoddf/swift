import UIKit

func flattenArray(nestedArray:[Any]) -> [Int] {
    var myFlattenedArray = [Int]()
    
    for element in nestedArray {
        
        if element is Int {
            print(element)
            myFlattenedArray.append(element as! Int)
        } else if element is [Any] {
            print(element)
            let recursionResult = flattenArray(nestedArray: element as! [Any])
            
            for num in recursionResult {
                myFlattenedArray.append(num)
            }
        }
       
    }
    
    return myFlattenedArray
}


let resultArray = flattenArray(nestedArray: [1, [2, [3], [4, [5]]]])

print("result: ", resultArray)

