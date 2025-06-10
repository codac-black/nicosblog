---
title: "Characteristics Of Cloud Native Architecture"
date: 2025-06-10T16:53:52+03:00
section: "Kubernetes and Cloud Native Essentials (LFS250)"
categories: ["Kubernetes and Cloud Native Essentials (LFS250)", "Cloud Native Architecture"]
---
---
section: "Kubernetes and Cloud Native Essentials (LFS250)"
categories: ["Kubernetes and Cloud Native Essentials (LFS250)", "Cloud Native Architecture"]
title: "Characteristics Of Cloud Native Architecture"
date: 2025-04-30
---
# Characteristics of Cloud Native Architecture

Cloud Native Architecture Characteristics:

- Close High level of automation
    
    To manage all the moving parts of your cloud native application, automation is recommended in every step from development to deployment. This can be achieved by using modern automation tools and _Continuous Integration/Continuous Delivery (CI/CD)_ pipelines (we will talk about pipelines more later in the course, but for now, please know that a CI/CD pipeline is a concept that can be used for the multiple steps that are needed when you deliver a new version of your software) that are backed by a version control system like git. Building, testing and deploying applications as well as infrastructure with minimal human involvement allows for fast, frequent and incremental changes to production. A reliable automated system also allows for much easier disaster recovery if you have to rebuild your whole system.
    
- Close Self healing
    
    Applications and infrastructure fail from time to time. This is expected, and therefore cloud native application frameworks and infrastructure components include health checks which help monitor your application from the inside and automatically restart them if necessary. Additionally, since the application has been compartmentalized, there is a chance that only parts of your application stop working or get slower, while other parts don’t.
    
- Close Scalable
    
    Scaling your application describes the process of handling more load while still providing a pleasant user experience. One way of scaling can be starting multiple copies of the same application and distributing the load across them. Automating this behavior based on application metrics like CPU or memory can also ensure availability and performance of your services.
    
- Close (Cost-) Efficient
    
    Just like scaling up your application for high traffic situations, scaling down your application and the usage-based pricing models of cloud providers can save costs if traffic is low. To optimize your infrastructure usage, orchestration systems like _Kubernetes_ can help with more efficient and denser placing of applications.
    
- Close Easy to maintain
    
    Using _Microservices_ allows to break down applications in smaller pieces and make them more portable, easier to test and to distribute across multiple teams.
    
- Close Secure by default
    
    Cloud environments are often shared between multiple customers or teams, which calls for different security models. In the past, a lot of systems were divided in different security zones that denied access from different networks or people. Once you’re inside a zone, you can access every system inside. Patterns like [zero trust computing](https://en.wikipedia.org/wiki/Zero_trust_security_model) mitigates that by requiring authentication from every user and process.
    

A good baseline and starting point for your cloud native journey is [the twelve-factor app](https://12factor.net/). The twelve factor app is a guideline for developing cloud native applications, which starts with simple things like version control of your codebase, environment-aware configuration and more sophisticated patterns like statelessness and concurrency of your application.

While these patterns and technologies provide full advantage if they run in the cloud, they can also offer a lot of benefits when applied to on-premises systems. Last but not least, they allow a smoother transition if you migrate your applications and infrastructure to the cloud.