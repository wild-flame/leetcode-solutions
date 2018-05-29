/**
 * David Lin
 * 2018-05-28
 *
 * @param {number[]} digits
 * @return {number[]}
 */
var plusOne = function(digits) {
    digits = digits.reverse()
    var i = 0
    while (true) {
        if (digits[i] === undefined) {
            digits[i] = 0
        }
        digits[i] = (digits[i] + 1) % 10
        if (digits[i] !== 0) {
            return digits.reverse()
        }
        i = i + 1
    } 
};


