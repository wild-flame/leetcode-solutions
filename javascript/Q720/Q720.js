/**
 * @param {string[]} words
 * @return {string}
 */
var longestWord = function(words) {
    
    // Sort the word 
    words.sort(function(a,b){
        if (a.length < b.length) {
           return -1; 
        } else if(a.length > b.length) {
           return 1;
        } else {
            if (a < b) {
                return 1;
            } else if (a > b) {
                return -1;
            } else {
                return 0
            }
        }
    })

    result = [] 
    index = 0
    // words
    words.forEach(function(word) {
        if (word.length === 1) {
            result.push(word)
            return 
        } 
        _cur = result.find(findWord, word)
        // console.log("_cur:" + _cur)
        if (_cur != null) { // do not use === when compare with null
            result.push(word)
        }
    })

    return result.last() // same as `results.slice(-1)[0]`
};

function findWord(word) {
    return word === this.slice(0,-1)
}

Array.prototype.last = function() {
    return this[this.length-1];
}
