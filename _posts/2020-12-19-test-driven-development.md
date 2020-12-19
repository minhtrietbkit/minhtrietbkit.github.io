---
title: "Test-Driven Development"
date: 2020-12-19
layout: post
category: 
---

Following summary is extracted from [Test-Driven Development with Python: Obey the Testing Goat: Using Django, Selenium, and JavaScript](https://www.amazon.com/Test-Driven-Development-Python-Selenium-JavaScript/dp/1491958707)

**NOTE**: Most of this summary are full quotes from the book; all diagrams are copied from the book.

# Process:

> 1. We start by writing a functional test, describing the new functionality from the user’s point of view.
> 2. Once we have a functional test that fails, we start to think about how to write code that can get it to pass (or at least to get past its current failure). We now use one or more unit tests to define how we want our code to behave—the idea is that each line of production code we write should be tested by (at least) one of our unit tests.
> 3. Once we have a failing unit test, we write the smallest amount of application code we can, just enough to get the unit test to pass. We may iterate between steps 2 and 3 a few times, until we think the functional test will get a little further.
> 4. Now we can rerun our functional tests and see if they pass, or get a little further. That may prompt us to write some new unit tests, and some new code, and so on.

# Interesting Note:

How to know if you're doing a good job applying TDD: you can tell where you left off by simply running the tests.

# Python TDD Cheatsheet

* Use unittest package

