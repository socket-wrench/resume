# My Resume as Code

This is my resume written as a port into AsciiDoctor

## Why?

This accomplishes the goal of breaking up the resume into seperate
files for easier maintenance.  Also I just thought it was pretty cool

It is hardly unique or new though.In fact and hacked this up with from 
an existing example I found at:
https://github.com/danmack/resume

## How?

AsciiDoctor as well as most WYSIWYG type document generators require a
lot of boiler plate and dependencies.  For that reason, it is best to
use a container to compartmentalize this attack surface and dependency
cesspool away from your normal desktop, laptop, or server.

Included in this repo are the source files for my resume and the
Open Container Initiative (OCI) environment which contains the asciidoctor
runtime.

  1. have OCI tools installed (e.g. docker)
  1. build the container using the included [Makefile](./Makefile)
  2. type make

## Workflow Examples

CentOS/RedHat/Fedora:

    % make image
    % make
    % xdg-open resume.html

macOS:

    % make dockerimg
    % make
    docker run -it -v /Users/mack/src/resume:/docs/ alpdoc     asciidoctor resume.adoc
    docker run -it -v /Users/mack/src/resume:/docs/ alpdoc asciidoctor-pdf resume.adoc
    % open resume.html

