---
title: "Cloud Native Architecture"
date: 2025-06-11T12:32:30+03:00
section: "Kubernetes and Cloud Native Essentials (LFS250)"
categories: ["Kubernetes and Cloud Native Essentials (LFS250)", "Cloud Native Architecture"]
---
---
title: Cloud Native Architecture
date: 4-30-2025
author: Bruno
draft: true
tags: 
section: "Kubernetes and Cloud Native Essentials (LFS250)"
categories: ["Kubernetes and Cloud Native Essentials (LFS250)", "Cloud Native Architecture"]
---
In this chapter, you will learn about the principles of modern application architecture, often referred to as Cloud Native Architecture. We will discover what makes these applications _native_ to cloud systems and how they differ from traditional approaches.

# Learning Objectives

By the end of this chapter, you should be able to:

- Discuss the characteristics of Cloud Native Architecture
- Explain the benefits of autoscaling and serverless patterns
- Understand the importance of open standards and community projects in cloud native environments


# Cloud Native Architecture Fundamentals

At the core, the idea of cloud native architecture is to optimize your software for cost efficiency, reliability and faster time-to-market by using a combination of cultural, technological and architectural design patterns.

The term _cloud native_ can be found in various definitions, some of which have a focus on technologies, while others may focus on the cultural side of things.

The [Cloud Native Computing Foundation defines it](https://github.com/cncf/toc/blob/main/DEFINITION.md) as following:

_“Cloud native technologies empower organizations to build and run scalable applications in modern, dynamic environments such as public, private, and hybrid clouds. Containers, service meshes, microservices, immutable infrastructure, and declarative APIs exemplify this approach._

_These techniques enable loosely coupled systems that are resilient, manageable, and observable. Combined with robust automation, they allow engineers to make high-impact changes frequently and predictably with minimal toil._ _[...]”_

Traditional or legacy applications are usually designed with a monolithic approach in mind, meaning that they are self-contained and include all the functionality and components that are needed to fulfill a task. A monolithic application usually has a single code base and is provided as a single binary file that can run on a server.

If you think of E-Commerce software for an online shop, a monolithic application would include every functionality from the graphical user interface, listing products, shopping cart, checkout, processing orders, and much more.

While it can be very easy to develop and deploy an application in this format, it can be equally difficult to manage complexity, scale development across multiple teams, implement changes fast, and be able to scale the application out efficiently when it comes under a lot of load.

Cloud native architecture can provide solutions for the increasing complexity of applications and the growing demand by users. The basic idea is to break down your application in smaller pieces which makes them more manageable. Instead of providing all functionality in a single application, you have multiple decoupled applications that communicate with each other in a network. If we stick to the example from before, you could have an app for your user interface, your checkout and everything else. These small, independent applications with a clearly defined scope of functions are often referred to as _microservices_.

That makes it possible to have multiple teams, each holding ownership of different functions of your application, but also operate and scale them individually. For example, if a lot of people try to buy products, you’re able to scale services that have a lot of load like the shopping cart and checkout.

**![Monolithic vs Microservices Architecture](https://d36ai2hkxl16us.cloudfront.net/course-uploads/e0df7fbf-a057-42af-8a1f-590912be5460/ch9ud860v954-Monolithicvsmicroservices.png)**

**Monolithic vs Microservices Architecture  
**

Cloud native architecture can have a lot of advantages, but can also be very complex to integrate and therefore must fulfill some requirements to work efficiently.