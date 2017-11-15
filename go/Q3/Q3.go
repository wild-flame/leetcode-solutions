package Q3

func lengthOfLongestSubstring(s string) int {
	runes := []rune(s)
	m := make(map[rune]int)
	left, right, max_len, cur_len := 0, 0, 0, 0

	for right < len(s) {
		if m[runes[right]] == 0 {
			m[runes[right]] += 1
			right += 1
		} else {
			m[runes[left]] -= 1
			left += 1
		}
		cur_len = right - left
		if cur_len > max_len {
			max_len = cur_len
		}
	}

	return max_len
}
