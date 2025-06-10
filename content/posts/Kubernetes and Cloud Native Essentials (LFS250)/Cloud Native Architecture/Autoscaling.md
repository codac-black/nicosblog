---
title: "Autoscaling"
date: 2025-06-10T16:59:30+03:00
section: "Kubernetes and Cloud Native Essentials (LFS250)"
categories: ["Kubernetes and Cloud Native Essentials (LFS250)", "Cloud Native Architecture"]
---
---
section: "Kubernetes and Cloud Native Essentials (LFS250)"
categories: ["Kubernetes and Cloud Native Essentials (LFS250)", "Cloud Native Architecture"]
title: "Autoscaling"
date: 2025-04-30
---
# Autoscaling

The autoscaling pattern describes the dynamic adjustment of resources based on the current demand. CPU and memory are the obvious metrics to decide on when to scale applications as load increases or decreases, but other methods based on time or business metrics can also be considered to scale your services up or down.

Typically, when we talk about autoscaling we’re talking about _horizontal scaling_, which describes the process of spawning new compute resources which can be new copies of your application process, virtual machines, or - in a less immediate way - even new racks of servers and other hardware.

_Vertical scaling_ on the other hand describes the change in size of the underlying hardware, which only works within certain hardware limits for bare metal, but also for virtual machines. Virtual machines and processes can be easily scaled up by allowing them to consume more CPU and memory, the upper limit is defined by the compute and memory capacity of the underlying hardware. The hardware itself can be scaled up, for example, by adding more RAM, but only until all RAM slots are occupied.

To illustrate the difference between scaling vertically and horizontally, imagine that you have to carry a heavy object that you cannot pick up. You can build muscle to carry it yourself, but your body has an upper limit of strength. That's vertical scaling. You can also call your friends and ask them to help you and share the work. That's horizontal scaling.

**![Horizontal vs vertical scaling](https://d36ai2hkxl16us.cloudfront.net/course-uploads/e0df7fbf-a057-42af-8a1f-590912be5460/q2cr3c5d6279-Horizontalvsverticalscaling.png)**

**Horizontal vs vertical scaling**

Configuring autoscaling in various environments requires configuring a minimum and maximum limit of instances (virtual machines or containers) and a metric that triggers the scaling. In order to configure the correct scaling, you often need to run many (near-production) load tests and analyze the behavior and load balancing when your application is scaled.

Cloud environments which rely on usage based on-demand pricing models provide very effective platforms for automatic scaling, with the ability to provision a large amount of resources within seconds or even scale to zero, if resources are temporarily not needed.

Even if scaling your applications and the underlying infrastructure is not automated at first, the ability to scale your application can increase availability and resilience of your services in more traditional environments.