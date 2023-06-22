let map = {};
let nums = [];
for (let i = 0; i < arr.length; i++) {
    const eachNum = arr[i];
    if (map[eachNum] == null) {
        map[eachNum] = true;
    } else {
        if (nums.length == 0) {
            nums.push(eachNum);
        } else {
            if (nums[nums.length - 1] > eachNum) {
                return -1;
            } else {
                nums.push(eachNum);
            }
        }
    }
}
return nums;