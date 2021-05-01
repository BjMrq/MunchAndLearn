# RICE Scoring

### A Priorisation Framework


## Objectives 🎯

- Understand the value of prioritizing the right thing
- Understand what should count when prioritizing features
- Understand what is the RICE scoring framework and how it can help us


## Prioritization

Everyday we have tasks we need to take care of and those tasks comes from everywhere, clients are requesting features, bugs are appearing in the wild.. So we need a way to navigate through all of this.
We are all hard workers, we do plenty during our days, but unfortunately it might not be enough.
We need to develop some features to make clients happy, we need to stay ahead of competition we also also need to stabilise our product to make it salable and able to support business growth.
If we are not able to focus on what matters and what is important now and in near future all this hard work is not worth as much as it could.

**We need a way to know how to tackle the right problem at the right time.** 

Creating a feature takes time, and we cannot build everything at the same time.

> How do you think we should decide the right order to build different features? What matters ?
> 
> At the end what brings the more value to our end users. Is what we should build first


Having a technically perfect product that does not bring any value to the users won’t be a success once launched: no one will want to use it.

So we need a way to identify what brings this value. We need a way to transforms those features requests and bugs and ideas to numbers so we can  calculate their priority and rely on data and facts.

And for this we can use a **framework named RICE, which puts numbers on the criteria we are naturally using to prioritize.**

Using a framework like this will put a score on our feelings and ideas. This score will help us make the right decisions and increase our confidence that we are doing things in the right order.


## RICE scoring framework

It comes from Intercom a messaging software, they developed the RICE prioritization model to improve its own internal decision-making processes.

**RICE** stands for **“Reach, Impact, Confidence, Effort.”** We will be evaluating every feature that we want to add to our product based on these criteria.

1. **Reach:** Measures the estimated amount of users who will be positively impacted by the feature. We are waiting for a number of users here

2. **Impact:**  Is about estimating the contribution of the feature to the user. We are trying to define how important for the users this feature will be
A good way to measure that is to use **5 predefined values:**
3 - massive impact
2 - high impact
1 - medium impact
0.5 - low impact
0.25 - minimal impact

3. **Confidence:**  is about acknowledging that some part of a feature might still rely on incertain parameters, calculating this uncertainty is very important and helps us make better decisions. It’s measured in percentage, with a minimum of 50%. (If it is lower, more research should be done first)

4. **Effort:** How much effort do we need to develop this feature? It’s an estimate of the “person-month” ratio required to create this feature. It starts at 0.5 and goes up

**The formula:**

RICE SCORE = (Reach * Impact * Confidence) / Effort

**The higher the score, the higher the priority.**


## Example

We are launching a new start-up!  It's a todo app (most amazing)!

we already analyzed the market and our users’ needs. **We know that our users need to manage a list of tasks** to do across multiple days. After defining the user journey, here the initiatives that we identified:
1. Login to save the list in the cloud
2. List of tasks to do
3. List of tasks to do by day
4. Add a new task
5. Mark task as done
6. Delete task
7. Add details to task

Let’s see the general idea by applying it to **“Login to save the list in the cloud”**:

- **Reach**: We think we are going to have around 1000 users. During our interviews, 50% of the interviewees told us they would like to save in the cloud. Let’s stick to that and say the reach will be 500 users.
- **Impact**: During the interviews, we understood that people wanting to save to the cloud wanted to do it “just in case they have a problem with their phone.” It’s not a feature they will use daily, but they are happy to have it. We think it’s a good idea to say it’s a “1 - Medium impact”: it’s not required, but bringing a lot of peace of mind to our users.
- **Confidence**: This feature comes directly from user feedback, so we have good confidence in the first estimates. We are not yet doing “cloud saves,” so we have a little bit of uncertainty about the effort it will take. Let’s select an 80% confidence level.
- **Effort**: We will need to create server and authentication layers. After a quick chat with the development team, it looks like it’s 3 weeks of work. (it's in weeks instead of month for this exemple, it's a todo app..)

**Result**



**And we now have a list of prioritized initiatives!**

One limit of this exercise is that it does not take into account the user journey.
For example, developing a “Mark a task as Done” feature without a “List of tasks” is nonsense… So we will have to tweak that a little bit.


## Flascards

https://www.cram.com/flashcards/rice-scoring-11900161
https://www.brainscape.com/p/3MI7W-LH-A5MZB
