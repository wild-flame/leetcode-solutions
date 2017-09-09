/**
 * David Lin
 * 2017-09-09
 * Method: Using regexp

 * @param {string} word
 * @return {boolean}
 */
var detectCapitalUse = function(word) {
    // 1. All letters in this word are capitals, like "USA".
    // 2. All letters in this word are not capitals, like "leetcode".
    // 3. Only the first letter in this word is capital if it has more than one letter, like "Google".
    return word.match(/(^[A-Z]+$)|(^[a-z\-]+$)|(^[A-Z][a-z\-]*$)/) != null
};
