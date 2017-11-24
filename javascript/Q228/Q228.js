/**
 * @param {number[]} nums
 * @return {string[]}
 */

var summaryRanges = function(nums) {
    let result = []

    if (nums.length === 0) {
        return []
    }
    
    let start = 0
    let end = 0

    while(true) {
        if (nums[end+1] === (nums[end] + 1)) {
            end = end + 1
        } else { 
            if (start === end) {
                result.push(""+nums[start])
                start = end + 1
                end = start
            } else {
                result.push(nums[start] + "->" + nums[end])
                start = end + 1 
                end = start
            }
        }
        
        if (nums[end] == null) {
            break
        }
    }

    return result
};

