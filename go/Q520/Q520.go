package detectCapitalUse

func detectCapitalUse(word string) bool {
	// David Lin
	// 2017-09-09

	// 1. All letters in this word are capitals, like "USA".
	// 2. All letters in this word are not capitals, like "leetcode".
	// 3. Only the first letter in this word is capital if it has more than one letter, like "Google".
	regex := `(^[A-Z]+$)|(^[a-z\-]+$)|(^[A-Z][a-z\-]*$)`
	matched, _ := regexp.MatchString(regex, word)
	return matched
}
