---
title:  "Private Vs Public Cloud"
date:   2019-01-08 21:00:00
categories: [ops]
tags: []
---
#Private Vs Public Cloud.
An old and some would say solved debate. There is plenty of marketing out there to say that it's not, but it is. I work for a Contino, a DevOps Transformation company that believes in being opinionated in order to deliver immediate value/return on investment and cultural shift by using DevOps tooling and Cloud Native development practices. Lots of buzz words but essentially we deliver value by cutting to the chase. The 'chase' in this case is "Use public cloud." As our North American comrades would end, "period".

Ok, that's my presentation done, I'll see you at the bar... oh, I have 9 minutes left? Ok. Lets play devils advocate and go over a few reasons why we find our clients and some of you, no doubt, are still considering Private Cloud.

Alternative reasons for a cloud vision; Lets take a moment to explore the reasons why people say they're still not comfortable.

Fear... http://mcguiremade.com/images/2/9.jpg
Fear is a pretty crappy motivator but it is a driver for some people and in the absence of solid rationale, it's where people tend to go. But what is there to be afraid of with Public Cloud?

Of regulators https://bitcoinist.com/wp-content/uploads/2018/05/shutterstock_138129767-regulation-rules1.jpg
Lets just take a moment to understand who considers themselves to be in a highly regulated industry? <wait for hands> Without too much detail, what would you say that industry was? Finance? Healthcare? Defence? <looks for confirmation>

Whether you are

Of incompetence https://images.baklol.com/90dc21d1cdbcaeaf276024f10177e5671442575841.jpg
I know that

Of Failure http://natbg.com/wp-content/uploads/2016/06/nature-summer-storm-new-zealand-nage-christchurch-sky-dark-trees-beautiful-clouds-super-cell-extreme-weather-lightning-high-resolution.jpg
"The company we are putting our trust in could fail"

Economy of scale https://static.seekingalpha.com/uploads/2016/3/11/saupload_Economies-of-Scale_MAEGs-Framework.png
C'mon guys. Really? Do you think you can rack them higher, pack them denser and make them more efficient than AWS, Google or MS? Some clients think they can, even with SLAs for changes running to two weeks, ...

Security/Compliance policies http://umanitoba.ca/admin/vp_admin/ofp/fippa/media/RM_About_Page.jpg

"Competition" with Amazon/Microsoft/Google
I've worked with a bunch of companies and my favourite and most difficult to deal with argument is that as company x does thing y, they feel they are competing with Amazon/Microsoft/Google and as such, it'd be bad form to give them money/rely on them for services/somehow they'd get your IP. I do not speak on behalf of the public cloud providers buy I assure you, if you consider yourself in competition with one of them, just pick another. Walmart considers Amazon a competitor. They just need to go GCP or Azure.

Technical Benefits (latency etc)
If you are building technology where your USP is that you have an x, y or z that your offering depends upon (lower point to point latency, a specific )

Ok, so fear is a crappy motivator, so lets consider some of the things people miss when they look at this debate as a VMWare in my DC Vs VMWare in the Cloud debate.

Great. You've had this chat with the powers that be in your place of work and they agree to dip their little toe in the Public Cloud pool. That could actually still to leave you with a problem proving the value. Here's why;

Cost of... agnostic Development
https://i4.ytimg.com/vi/sQSesrHv76k/maxresdefault.jpg
Trying to be agnostic from the underlying PaaS value will mostly void the value of those PaaS services. Bizarrely, it's actually self justifying. Why would you bother to develop against a PaaS solution (SES, MQ, RedShift, etc etc) when you have to spend an age abstracting yourself from the implementation specific details of the service. "I'd love to use teh service you provide but first I have to write an abstraction adapter to allow me to use the same core code with any of your competitors". This missed the point... Isn't agile, incremental, etc.

Cost of... implementing services

Implementing the right thing in the right place
https://i.ytimg.com/vi/BSoT5R4bnXQ/hqdefault.jpg


Gravity well.

Development Cycle (3d printing example)
Ok, so lets say that you really do
