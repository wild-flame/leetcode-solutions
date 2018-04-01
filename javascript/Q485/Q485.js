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
        console.log(maxConsecutive)
    })
    return maxConsecutive
};
