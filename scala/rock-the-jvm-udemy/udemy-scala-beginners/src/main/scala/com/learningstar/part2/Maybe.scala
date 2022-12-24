package com.learningstar.part2

trait Maybe[+A]:
  def map[B](f: A => B): Maybe[B]
  def flatMap[B](f: A => Maybe[B]): Maybe[B]
  def filter(f: A => Boolean): Maybe[A]

case object MaybeNot extends Maybe[Nothing]:
  override def map[B](f: Nothing => B): Maybe[B] = MaybeNot

  override def flatMap[B](f: Nothing => Maybe[B]): Maybe[B] = MaybeNot

  override def filter(f: Nothing => Boolean): Maybe[Nothing] = MaybeNot

case class Just[+T](value: T) extends Maybe[T]:
  override def map[B](f: T => B): Maybe[B] = Just(f(value))

  override def flatMap[B](f: T => Maybe[B]): Maybe[B] = f(value)

  override def filter(f: T => Boolean): Maybe[T] =
    if (f(value)) this
    else MaybeNot

object Maybee:
  @main def maybe(): Unit =
    val just3 = Just(3)
    println(just3)
    println(just3.map(_ * 3))
    println(just3.flatMap(x => Just(x % 2 == 0)))
    println(just3.filter(_ % 2 == 0))