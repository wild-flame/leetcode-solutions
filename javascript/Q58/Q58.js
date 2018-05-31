/**
 * David Lin
 * 2018-05-31
 *
 * @param {string} s
 * @return {number}
 */


/* method 1 */

var lengthOfLastWord = function(s) {
    return s.replace(/\s*$/, '').split(/\s+/).slice(-1)[0].length    
};

/* method 2 */
/* Create a last shortcut function for Array. */

Array.prototype.last = function(){
    return this[this.length - 1];
};

var lengthOfLastWord = function(s) {
    return s.split(/\s+/).last().length     
};


