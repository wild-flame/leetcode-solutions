/* 
 * 2018-05-29
 * Author：David Lin
 * 思路：
 * 1. 首先 brute-force
 * 2. Brute-force 以后 考虑 dp
 * 3. 考虑 dp 以后根据递推条件发现可以直接分奇偶考虑
*/

/**
 * Method 1: Brute Force
 */

/* rewrite the String prototype */
String.prototype.reverse = function() {
    return this.split("").reverse().join("")
}

/**
 * @param {string} s
 * @return {string}
 */
var longestPalindrome = function(s) {
    var maxLongestLength = 0
    var curLongestLength = 0
    var result = ""

    for (i = 0; i< s.length; i++) {
        for (j = i; j< s.length; j++) {
            if (s.slice(i,j) === s.slice(i,j).reverse()) {
                curLongestLength = j - i + 1 
                if (curLongestLength > maxLongestLength) {
                    result = s.slice(i,j)
                    maxLongestLength = curLongestLength
                }
            }
        }
    }
    return result
};


/**
 * Method 2: 分奇偶 
 */

/**
 * @param {string} s
 * @return {string}
 */
var longestPalindrome = function(s) {
    var result = ""

    // 奇数
    for (var i=0;i< s.length;i++) {
        var offset = 0 
        while (i-offset >= 0 && i+offset <= s.length -1 && s[i-offset] === s[i+offset]) {
            cur_result = s.slice(i-offset,i+offset + 1)
            offset = offset + 1
        }
        if (cur_result.length > result.length) {
            result = cur_result 
        }
    }

    // 偶数
    for (var i=0;i < s.length;i++) {
        if (i < s.length -1 && s[i] === s[i+1]) {
            var offset = 0
            while (i-offset >= 0 && i+1+offset <= s.length -1 && s[i-offset] === s[i+1+offset]) {
                cur_result = s.slice(i-offset, i+offset + 2)
                offset = offset + 1
            }
            if (cur_result.length > result.length) {
                result = cur_result 
            }
        }
    }

    return result
};

// 参考
// https://articles.leetcode.com/longest-palindromic-substring-part-ii/
// testcase: "abacdfgdcaba","bb"
