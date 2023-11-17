package example

import munit.FunSuite

class HelloTest extends FunSuite {
  test("Test 1") {
    val expected = 7
    val actual = 4 + 3
    assertEquals(actual, expected)
  }
}
