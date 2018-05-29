/**
 * David Lin
 * 2017.04.01
 *
 * @param {number[]} nums
 * @return {number}
 */

var findMaxConsecutiveOnes = function(nums) {
    var maxConsecutive = 0
    var curConsecutive = 0
    nums.forEach(function(cur){
        if (cur === 0) {
            curConsecutive = 0 
        } else if (cur === 1) {
            curConsecutive = curConsecutive + 1
        } else {
            // Do Nothing
        }
        maxConsecutive = Math.max(maxConsecutive, curConsecutive)
    })
    return maxConsecutive
};




/**
 * David Lin
 * 2017.04.01
 *
 * @param {number[]} nums
 * @return {number}
 */
var findMaxConsecutiveOnes = function(nums) {
    if (nums.length === 0)  { 
        return 0
    }
    
    var maxConsecutive = 0
    var curConsecutive = 0
    for (i=0; i<nums.length; i++) {
        if (nums[i] === 1) {
            curConsecutive = curConsecutive + 1
            maxConsecutive = Math.max(curConsecutive, maxConsecutive)
        } else if (nums[i] === 0) {
            curConsecutive = 0
        } else {
            throw "unknown digits"
        }
    }

    return maxConsecutive
};
