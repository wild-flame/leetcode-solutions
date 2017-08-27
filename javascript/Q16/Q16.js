/**
 * David Lin
 * 2017 08 27
 * O(n^2)
 *
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var threeSumClosest = function(nums, target) {
    nums = nums.sort((a,b)=>{ return a-b })
    
    let distance = target - nums.slice(0,3).reduce((prev,cur) => { return cur + prev })

    for (let ai = 0; ai < nums.length - 2; ai++) {
        let bi = ai + 1
        let ci = nums.length - 1
        let sum = 0
        let dis = distance 

        while (bi < ci) {
            sum = nums[ai] + nums[bi] + nums[ci]
            console.log("sum"+sum)
            dis = target - sum
            if (dis < 0) {
                ci--
            } else if (dis > 0) {
                bi++
            } else {
                return sum
            }
            if (Math.abs(dis) < Math.abs(distance)) {
                distance = dis
            }
        }


    }

    return target - distance
}

// console.log(threeSumClosest([-1,-2,5,3,2,9,-4],11))
console.log(threeSumClosest([1,2,5,10,11],12))
