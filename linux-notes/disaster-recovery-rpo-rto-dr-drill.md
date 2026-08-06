1. Disaster Recovery (DR)

Simple meaning:
Disaster Recovery is a plan to restore systems and data after a major failure.

A disaster could be:

Server crash
Hard disk failure
Data center outage
Fire or flood
Cyberattack (such as ransomware)

Example:
Your production Linux server crashes. Using backups and a standby server, you restore the system and make the application available again. This entire process is called Disaster Recovery (DR).

2. RPO (Recovery Point Objective)

Simple meaning:
RPO tells you how much data loss is acceptable.

Example
Backups are taken every 1 hour.
The server crashes at 3:30 PM.
The latest backup is from 3:00 PM.

You lose 30 minutes of data.

RPO = 1 hour (because backups are taken every hour).

4. What is a DR Drill?

A DR Drill is a practice test to verify that the disaster recovery plan actually works before a real disaster happens.

Think of it like a fire drill in an office. You practice what to do during a fire so everyone knows the process. Similarly, a DR drill checks whether you can recover servers and data successfully.

Example

Suppose your production Linux server fails.

During a DR drill, the team will:

Restore the server from backup.
Recover the application.
Verify that all services are running.
Check that users can access the application.
Measure how long recovery took and whether it met the RTO and RPO.

Easy Definition

RPO is the maximum amount of data that can be lost after a failure.

3. RTO (Recovery Time Objective)

Simple meaning:
RTO tells you how quickly the system must be restored.

Example

The company says:

"If the server crashes, it must be running again within 2 hours."

RTO = 2 hours

Easy Definition

RTO is the maximum time allowed to restore the system after a disaster.
