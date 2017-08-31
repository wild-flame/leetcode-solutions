func findRestaurant(list1 []string, list2 []string) []string {
  // David Lin
  // 2017-08-31
  // Hashing 

  m := make(map[string]int)
  n := make(map[string]int)
  var result []string

  for i:=0;i<len(list1);i++ {
    m[list1[i]] = i+1
  }

  for j:=0;j<len(list2);j++ {
    if m[list2[j]] != 0 {
      n[list2[j]] = j + 1 + m[list2[j]]
    }
  }

  cur_v := 2000

  for k, v := range n {
    if cur_v < v {
      continue
    } else if cur_v == v{
      result = append(result, k)
      cur_v = v
    } else {
      result = []string{k}
      cur_v = v
    }
  }

  return result
}
