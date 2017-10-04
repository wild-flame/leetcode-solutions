package Q394

import "testing"

func TestDecodeString(t *testing.T) {
	s := "2[abc]3[cd]ef3[a2[c]]"
	r := "abcabccdcdcdefaccaccacc"

	s2 := "10[leetcode]"
	r2 := "leetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcode"

	a := decodeString(s)
	a2 := decodeString(s2)

	if r != a {
		t.Error(r, a)
	}

	if r2 != a2 {
		t.Error(r2, a2)
	}
}
