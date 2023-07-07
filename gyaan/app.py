def sizeOfLongestConsecutive(self, nums: List[int]) -> int:
    s = set(nums)
    maxSize = 0
    for n in s:
        if n - 1 in s:
            continue
        size = 0
        while n in s:
            size += 1 
            n += 1
        maxSize = max(maxSize, size)
    return maxSize
