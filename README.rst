####################
Python template test
####################

.. image:: https://img.shields.io/badge/doc-latest-blue.svg
   :target: https://andrewenoble-org.github.io/aws-cdk-demo/
   :alt: Docs

.. image:: https://img.shields.io/badge/python-3.9%7C3.10-blue.svg
   :target: https://img.shields.io/badge/python-3.9%7C3.10-blue.svg
   :alt: Python Versions

.. image:: https://img.shields.io/pypi/l/tox?style=flat-square
   :target: https://opensource.org/licenses/MIT
   :alt: License

.. image:: https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg
   :target: https://www.contributor-covenant.org/version/2/1/code_of_conduct.html
   :alt: Code of Conduct

.. image:: assets/coverage/coverage.svg
   :target: https://github.com/andrewenoble-org/aws-cdk-demo/blob/main/assets/coverage/coverage.svg
   :alt: Code Coverage

|

.. image:: https://github.com/andrewenoble-org/aws-cdk-demo/actions/workflows/merge_pages.yml/badge.svg
   :target: https://github.com/andrewenoble-org/aws-cdk-demo/actions/workflows/merge_pages.yml/badge.svg
   :alt: Merge Pages

.. image:: https://github.com/andrewenoble-org/aws-cdk-demo/actions/workflows/merge_release.yml/badge.svg
   :target: https://github.com/andrewenoble-org/aws-cdk-demo/actions/workflows/merge_release.yml/badge.svg
   :alt: Merge Release

.. image:: https://github.com/andrewenoble-org/aws-cdk-demo/actions/workflows/pr_lint.yml/badge.svg
   :target: https://github.com/andrewenoble-org/aws-cdk-demo/actions/workflows/pr_lint.yml/badge.svg
   :alt: PR List

.. image:: https://github.com/andrewenoble-org/aws-cdk-demo/actions/workflows/pr_test.yml/badge.svg
   :target: https://github.com/andrewenoble-org/aws-cdk-demo/actions/workflows/pr_test.yml/badge.svg
   :alt: PR Test

========
Overview
========

A Dockerized development environment for building and deploying AWS CDK applications.

===
WIP
===

#. Current application specified within the :code:`aws_cdk_demo` is a warm-up excerise from
   the `AWS Solutions Constructs Walkthrough - Part 2 <https://docs.aws.amazon.com/solutions/latest/constructs/walkthrough-part-1-v2.html>`_.
   Goal is to borrow from `AWS Solutions MLOps Workload Orchestrator <https://github.com/aws-solutions/mlops-workload-orchestrator/tree/main>`_
   to demo a single-account CI/CD deployment

#. Add aws_cdk_demo/tests

#. Add numpy docstrings

=====
Usage
=====

#. Install and launch
   `Docker Desktop <https://docs.docker.com/desktop/>`_ and
   `VSCode <https://code.visualstudio.com/download>`_

#. Check that :code:`git` and :code:`python` are installed on your local machine,
   with :code:`python --version 3.9` or :code:`3.10`.  You may also need to
   :code:`pip install pyyaml`

#. Within your working directory, clone the repository 

   .. code:: bash

      $ git clone https://github.com/andrewenoble-org/aws-cdk-demo.git

#. Within the cloned repository, build a Development Environment `Docker` image and 
   deploy a Development Environment `Docker` container

   ```bash
   make build && make run
   ```

   Note: `make run` may fail if another Docker container is using the `8888` port on
   the host machine.  If so, edit the Makefile, changing `8888:8888` to `8889:8888` or
   similar.

#. Open `VSCode`, install
   [Docker Extension](https://code.visualstudio.com/docs/containers/overview),
   and follow the `Docker Extension` instructions to Attach a `VSCode` Window to your
   Docker container

#. Click on the blue `Open Folder` button, and navigate at the top of the `VSCode`
   window to the `/home/project` directory.  This is the containerized Development
   Environment working directory

#. Ensure that your `.aws` folder containing `config` and `credentials` files is 
   in the `/home/project` working directory.  You can create the `.aws` folder by 
   running `aws configure`

#. Open a `VSCode` terminal, deploy the `hello-constructs-stack` app to your 
   AWS account

   ```bash
   cd aws_cdk_demo && cdk deploy
   ```

#. See :code:`.github/CONTRIBUTING.md` for remaining steps in setting up the 
   recommended Development Environment

.. note::
   These instructions have been tested on a MacBookPro with

   * MacOSX Ventura v13.3.1
   * Docker v20.10.23, build 7155243
   * VSCode v1.78.2 (Universal)
   * python v3.9.16
   * git v2.40.0
