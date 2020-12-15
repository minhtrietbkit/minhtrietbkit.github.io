---
title: "Goal of Unit Test and What To Test If You're A Programmer?"
date: 2020-12-15
layout: post
category: devops
---

**NOTE**: Most of this summary are full quotes from the book; all diagrams are copied from the book.

# Why Unit Test?

Unit tests verify functionality of a small subset of the system, such as an object or method.

The benefits of applying writing unit tests first:

* Provide information quickly and enable fast troubleshooting
* Provide a safety net enabling the programmers to refactor frequently. This keeps the code at a reasonable standard of maintainability and delivers the best value for the time invested. Technical debt is kept as low as possible.
* Help the team to focus on the story that’s being delivered and to take the simplest approach that will work. (I think this is very true of TDD)
* Help programmers understand exactly what the code needs to do and provide guidance in the right system design.
* Writing unit tests and writing code with those tests in mind means programmers are always consciously making code testable.

Example of Unit Tests

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

TBD