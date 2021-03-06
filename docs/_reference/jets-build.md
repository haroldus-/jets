---
title: jets build
reference: true
---

## Usage

    jets build

## Description

Builds and packages project for AWS Lambda.

Builds a zip file package to be uploaded to AWS Lambda. This allows you to build the project without deploying and inspect the zip file that gets deployed to AWS Lambda. The package contains:

* your application code
* generated node shims
* bundled gems
* bundled Ruby

If the application has no ruby code and only uses polymorphic functions, then gems and Ruby is not bundled up.

## Options

```
[--templates], [--no-templates]  # Only build the CloudFormation templates. Skip code building
[--noop], [--no-noop]            
```

