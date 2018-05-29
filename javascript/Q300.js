/**
 * @param {number[]} nums
 * @return {number}
 *
 * TESTCASE:[10,9,2,5,3,4]
 *
 */

var lengthOfLIS = function(nums) {
    var memo = {};
    var longest_length = 0

    for (i = 0; i < nums.length; i++) {
        cur_length = lengthOfLIS_DP(i, nums, memo)
        longest_length = Math.max(longest_length, cur_length)
    } 

    return longest_length 
};

var lengthOfLIS_DP = function(start,nums,memo) {

    // if (memo[start] !== undefined) {
    //     return memo[start]
    // }

    var longest_length = 1

    for (j = start+1; j < nums.length; j++) { 
        console.log("start", start, "j", j)
        if (nums[start] < nums[j]) {
            cur_length = 1 + lengthOfLIS_DP(j, nums, memo)
            longest_length = Math.max(longest_length, cur_length)
        } 
    }
    
    memo[start] = longest_length

    console.log("memo",memo)
    
    return longest_length

}



