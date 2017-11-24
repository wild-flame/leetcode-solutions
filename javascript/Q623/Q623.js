/**
 * @param {TreeNode} root
 * @param {number} v
 * @param {number} d
 * @return {TreeNode}
 */
var addOneRow = function(root, v, d) {
    // 二叉树层序遍历
    //
    // 二叉树的层序遍历的实现还是比较简单的，由于其层级的关系，
    // 很明显要用到队列来辅助实现，主要是从左向右，自上而下，
    // 依次将二叉树的各节点入队，这样便可以保证输出的顺序是层序排列的。

    queue = []

    queue.push("#")
    queue.push(root)
    cur_depth = 1

    if (d === 1) {
        new_root = new TreeNode(v)
        new_root.left = root
        root = new_root
    }

    while (queue.length !== 1) {

        // console.log(queue)
        a = queue.shift() 

        if (a === "#") {
            cur_depth += 1
            queue.push("#")
        }

        if (a.left != null) {
            queue.push(a.left)
        } 

        if (a.right != null) {
            queue.push(a.right)
        }

        if (cur_depth === d) {
            left_tree_root = new TreeNode(v)
            if (a.left != null) {
                left_tree_root.left = a.left
            }
            a.left = left_tree_root

            right_tree_root = new TreeNode(v)
            if (a.right != null) {
                right_tree_root.right = a.right
            }            
            a.right = right_tree_root
        }




    }
    return root

};




