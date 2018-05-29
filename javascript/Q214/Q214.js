/**
 * @param {string} s
 * @return {string}
 */

// 
// b a a b

//   i j     
// d b c d
//       
//
// Method 1: Two pointers (TLE)

var shortestPalindrome = function(s) {
    var i = 0 
    var j = s.length
    var end = s.length 

    while (i<j) {
        if (s[i] === s[j]) {
            i++;
            j--;
        } else {
            i = 0
            end = end -1 
            j = end 
        }
    } 

    return s + s.slice(end+1,str.length).split("").reverse().join("") 
};

// Method 2: KMP
