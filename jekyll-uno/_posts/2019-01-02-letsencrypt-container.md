---
title:  "Using LetsEncrypt Ephemerally"
date:   2019-01-02 21:00:00
categories: [ops]
tags: [letsencrypt, s3, cloudfront, tls, ssl, https, route53, certbot, circleci, docker, containers]
---

## Delivering encrypted static websites using S3, Cloudfront and LetsEncrypt

LetsEncrypt is a great project launched in 2016 by, among others, Mozilla and the Electronic Frontier Foundation, to make TLS certs and therefore https encryption an accessible standard for all of us. Most of the documentation out there demonstrates how to use CertBot to create and maintain certs on static webservers, but with modern single page apps and other static content that no longer needs Apache, Nginx and their like, why pay to run a server when you can deliver the same content for pennies? I built this blog using just these technologies, but the LetsEncrypt was a touch more in depth than I initially suspected it would be. Lets dig into that.

### LetsEncrypt, ACME and Certbot

The LetsEncrypt service presents a Restful API which clients can use a challenge-response protocol call Automated Certificate Management Environment (ACME) to obtain and renew certificates. As part of that, number of of state files are created that are subsequently used to renew certificates. Great, but how can I use that when I'm not maintaining a server upon which that would reside? We should probably maintain that somewhere.

### S3; the filestore for the serverless

Using S3 as a filestore is a great way of persisting files without maintaining an actual file system. Seeing as we don't have a persistent file system handy in our ephemeral state, that's handy. In order to persist that state, we'll need to write a little code (in this case shell), to pull and push the state as required.

### LetsEncrypt Verification

Allowing anyone to create certs for any domain would probably be a bad thing. Therefore LetsEncrypt forces you to do some proof of ownership work. In this case, we will be using the AWS Route53 plugin to use the actual DNS entry for the URL in question to prove ownership. We'll also need to create an IAM profile and role to allow a user to securely to that.

### S3 -> CloudFront

Hosting static content in S3 using the 'website' function it offers sounds great, but S3 doesn't actually allow you to use your own SSL certs to create an HTTPS endpoint. Fortunately, CloudFront (the AWS CDN), does. Once we have configured that, we just need to get it to use the new cert.

So to recap,
LetsEncrypt Cert -> CloudFront <- S3 <- Static Content
Cert state -> S3

Just to host a static website? I thought this was supposed to be easy?
