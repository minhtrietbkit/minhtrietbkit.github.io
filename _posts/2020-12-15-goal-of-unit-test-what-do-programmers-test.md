---
title: "Goal of Unit Test and What To Test If You're A Programmer?"
date: 2020-12-15
layout: post
category: devops
---

**NOTE**: Most of this summary are full quotes from the books [xUnit Test Patterns: Refactoring Test Code](https://www.amazon.com/xUnit-Test-Patterns-Refactoring-Code/dp/0131495054) and [Agile Testing: A Practical Guide for Testers and Agile Teams](https://www.amazon.com/Agile-Testing-Practical-Guide-Testers/dp/0321534468); all diagrams are copied from the book.

# What is Unit Test?

> Unit tests verify the behavior of a single class or method that is a consequence of a design decision. This behavior is typically not directly related to the requirements except when a key chunk of business logic is encapsulated within the class or method in question. These tests are written by developers for their own use; they help developers describe what "done looks like" by summarizing the behavior of the unit in the form of tests. ~ xUnit Patterns: Refactoring Test Code, Chapter 5

# Why Unit Test?

Unit tests verify functionality of a small subset of the system, such as an object or method.

The benefits of applying unit tests and writing tests first:

* Provide information quickly and enable fast troubleshooting
* Provide a safety net enabling the programmers to refactor frequently. This keeps the code at a reasonable standard of maintainability and delivers the best value for the time invested. Technical debt is kept as low as possible.
* Help the team to focus on the story that’s being delivered and to take the simplest approach that will work. (I think this is very true of TDD)
* Help programmers understand exactly what the code needs to do and provide guidance in the right system design. (Test as specification)
* Help programmers describe what "done looks like" by summarizing the behavior of the unit in the form of tests. (Test as specification)
* Help answer the question "What should be the result if..." easily and confidently.
* Writing unit tests and writing code with those tests in mind means programmers are always consciously making code testable.
* Localize defects - customer tests confirm issues exist; unit tests reveal why/where bug exists (Though I'm not sure how this helps developer because unit tests are supposed to be run before customer tests and if it failed, customer tests are not supposed to be run).
* Provide capability to verify the software's behavior in the "impossible" circumstances that cannot be induced when doing traditional customer testing of the entire application as a black box.

# Example of Unit Tests

Full quote from Chapter 7

> WHERE DO TECHNOLOGY-FACING TESTS STOP?
> 
> We often hear people worry that the customer-facing tests will overlap so much with the technology-facing tests that the team will waste time. We know that business-facing tests might cover a bit of the same ground as unit or code integration tests, but they have such different purposes that waste isn’t a worry.
> 
> For example, we have a story to calculate a loan amortization schedule and display it to a user who’s in the process of requesting a loan. A unit test for this story would likely test for illegal arguments, such as an annual payment frequency if the business doesn’t allow it. There might be a unit test to figure the anticipated loan payment start date given some definition of amount, interest rate, start date, and frequency. Unit-level tests could cover different combinations of payment frequency, amount, interest date, term, and start date in order to prove that the amortization calculation is correct. They could cover scenarios such as leap years. When these tests pass, the programmer feels confident about the code.
> 
> Each unit test is independent and tests one dimension at a time. This means that when a unit test fails, the programmer can identify the problem quickly and solve the issue just as quickly. The business-facing tests very seldom cover only one dimension, because they are tackled from a business point of view.
> 
> The business-facing tests for this story would define more details for the business rules, the presentation in the user interface, and error handling. They would verify that payment details, such as the principal and interest applied, display correctly in the user interface. They would test validations for each field on the user interface, and specify error handling for situations such as insufficient balance or ineligibility. They could test a scenario where an administrator processes two loan payments on the same day, which might be harder to simulate at the unit level.
> 
> The business-facing tests cover more complex user scenarios and verify that the end user will have a good experience. Push tests to lower levels whenever possible; if you identify a test case that can be automated at the unit level, that’s almost always a better return on investment.

# What To Test If You're A Programmer

![Kinds of Tests as Classified by Agile Testing: A Practical Guide for Testers and Agile Teams](/assets/goal-of-unit-test-what-do-programmers-test/kinds-of-tests-agile-book.png)
![Kinds of Tests as Classified by xUnit Patterns: Refactoring Test Code](/assets/goal-of-unit-test-what-do-programmers-test/kinds-of-tests-xunit-book.png)

Although the principle is that "everyone is responsible", programmers are directly in charge of Technology and Development facing tests: Unit and Component tests. More advanced testings that programmer may be directly involved is a kind of product criticizing test - Property tests ("Ility" tests).