/**
 * Return all summed number.
 * @param numbers Number arguments.
 */
export default function add(...numbers: number[]) {
  return numbers.reduce((result, current) => current + result, 0);
}
