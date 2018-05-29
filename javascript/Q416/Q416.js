/**
 * David Lin
 * 2018-04-12
 *
 * @param {number[]} nums
 * @return {boolean}
 */
var canPartition = function(nums) {

    var bits = [true]
    // bottom to top using bit
    
    for (let index = 0; index < nums.length; index++) {
        const num = nums[index] 
        var new_bits = []
        for (let j = 0; j < bits.length; j++) {
            if (bits[j] === true) {
                new_bits[index] === true
                new_bits[num + index] === true
            } 
        }
        bits = new_bits
    }

    return (bits.length - 1) % 2 === 0 && bits[(bits.length - 1) / 2] === true
};

// Reference: http://www.cnblogs.com/grandyang/p/5951422.html

