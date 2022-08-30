/**
 * The knows API is defined in the parent class Relation.
 * isBadVersion(version: number): boolean {
 *     ...
 * };
 */

const solution = (isBadVersion: Function) => {
  return (n: number): number => {
    let start = 1;
    let end = n;

    // create a base condition
    // if (start < end) return end
    while (start < end) {
      // find the middle index
      let mid = Math.floor((start + end) / 2);
      //compare middle with given key n
      if (!isBadVersion(mid)) {
        start = mid + 1;
      } else {
        end = mid;
      }
    }
    return start;
  };
};
