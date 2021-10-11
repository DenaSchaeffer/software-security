# Repository for CPS474/CPS574 Software Security/Language-based Security
## Instructor: Dr. Phu Phung
## Department of Computer Science
## University of Dayton

### To clone:

Open a terminal in your Linux shell, and type:

```shell
git clone https://bitbucket.org/ss-lbs/ss-lbs.git 
```
### Labs

##### Lab 1

This lab experiment is to help you understand the vulnerability of data races time-of-check to time-of-use (TOCTOU). 
You are provided a Java application and some buggy APIs. Your tasks include exploiting the TOCTOU bug to perform the attack. 
After that, you will customize the code and write a report to demonstrate your understanding. Note that Assignment 1 will be based on this buggy application.

##### Lab 2

This lab consists of two parts. 

1. In Part I, the goal is to understand the Inlined Reference Monitors (IRMs) by implementing it using the concept of Aspect-Oriented Programming (AOP).  First, you will do hands-on exercises with AspectJ (aspect-oriented programming language for Java) code. You will do experiments to learn how to implement inlined reference monitors (IRMs) using AOP, a part of programming Assignment 1. 

2. In Part II, you will learn reverse engineering. In particular, you will earn how to decompile Java bytecode (Java Reverse Engineering) using the JD-GUI tool to understand how the advice is woven to Java bytecode. In addition, you will learn and do reverse engineering for a hybrid Android app to inject a simple code into the app and repack it.


##### Lab 3

The goal of this lab experiment is to understand the buffer overflow attack by performing a real exploit in a vulnerable program. You are provided the vulnerable program (myecho), and shellcode (dash-shellcode.txt). You need to construct a payload to perform the buffer overflow attack to execute the shellcode.

##### Lab 4

This lab exercise will help you to understand how a web application works, including session management, database interactions, user interaction with JavaScript. It is a foundation for the next labs to perform and understand web application vulnerabilities and attacks.


### Assignments

##### Assignment 1

This programming assignment is an extension of Lab 1&2. The goals of this assignment are two fold:

1. Fixing time-of-check time-of-use (TOCTOU) in the vulnerable program and buggy APIs. There is an intentional programming flaw in this fixed program that makes it semantically incorrect. 
2. Using AOP (the AspectJ language) to enforce security policies on the fixed program in Part 1 to change the semantics of the program at runtime so that it will function sound.
