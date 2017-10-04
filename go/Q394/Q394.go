package Q394

func decodeString(s string) string {
	u, _ := repeatString(s, 0)
	return u
}

func repeatString(s string, i int) (string, int) {
	var k int // repeat k times
	var r, u string

	for ; i < len(s); i++ {
		c := byte(s[i])

		if '0' <= c && c <= '9' {
			k = 10*k + int(c) - '0'
			fmt.Print(k)
		} else if c == '[' {
			r, i = repeatString(s, i+1)
			for j := 0; j < k; j++ {
				u += r
			}
			k = 0
		} else if c == ']' {
			return u, i
		} else {
			u += string(c)
		}
	}
	return u, i
}
