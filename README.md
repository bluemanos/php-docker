# PHP CI Kit for Docker

This repository contains a set of utilities for running PHP tests via [Gitlab CI](https://about.gitlab.com/gitlab-ci/) with most common database MySQL.

## Supported PHP versions:

1. PHP 7.2
1. PHP 7.3
1. PHP 7.4

The goal of these tools is to automate as much as possible of routine work related to configuring the runner so you can concentrate on writing tests for your code.
Also these tools are trying to be resources savvy, since in most cases huge in-RAM caches are not needed for just running unit tests with some fixtures. So you can use very small VMs for running tests

## Similar projects
 - https://github.com/TetraWeb/docker
