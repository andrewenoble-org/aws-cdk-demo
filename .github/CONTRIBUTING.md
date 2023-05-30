# Contributing Guidelines

All types of contributions are welcome!

## Table of Contents

* [Code of Conduct](#code-of-conduct)
* [Asking a Question](#asking-a-question)
* [Contributing](#contributing)
* [Coding Conventions](#coding-conventions)
* [Development Environment](#development-environment)
* [GitHub Configuration](#github-configuration)
* [Legal Notice](#legal-notice)

## Code of Conduct

This project and everyone participating in it is governed by a standard
[Code of Conduct](https://github.com/andrewenoble-org/aws-cdk-demo/blob/main/.github/CODE_OF_CONDUCT.md).
By participating, you are expected to uphold this code. Please report unacceptable
behavior to
[andrewenoble@gmail.com](mailto:andrewenoble@gmail.com).

## Asking a Question

Please first check if current
[GitHub Pages documentation](https://andrewenoble-org.github.io/aws-cdk-demo/)
or Issues linked to existing
[GitHub Projects](https://github.com/andrewenoble-org/aws-cdk-demo/projects)
address the question

If you still have a question or would appreciate further clarification, please open a
new
[GitHub Issue](https://github.com/andrewenoble-org/aws-cdk-demo/issues/new)
and carefully fill out the template with all requested information.

## Contributing

Please follow these steps to open a new GitHub Issue ticketed to a GitHub Project
(see [GitHub Configuration](#github-configuration) below),
make changes on a corresponding branch within your `VSCode` Development Environment
(see [Development Environment](#development-environment) below),
and raise a GitHub Pull Request

1. Check if current
   [GitHub Pages documentation](https://andrewenoble-org.github.io/aws-cdk-demo/)
   or Issues linked to an existing
   [GitHub Project](https://github.com/andrewenoble-org/aws-cdk-demo/projects)
   are relevant to your bug report, feature request, or suggested enhancement

2. Open a new
   [GitHub Issue](https://github.com/andrewenoble-org/aws-cdk-demo/issues/new)
   with name \<Issue-Short-Title\>
   and carefully fill out the template with all requested information

3. Once the Issue is open, select a relevant
   [GitHub Project](https://github.com/andrewenoble-org/aws-cdk-demo/projects),
   select "Add item" on a view within that project, search for your Issue by typing
   `#aws-cdk-demo` in the text box, and then add the Issue.  This automatically
   generates an `<item-number>` for the Issue in the Project.  Modify the Issue
   title to `<PROJECT-ABBR>-<item-number>-<Issue-Short-Title>`,
   where `<PROJECT-ABBR>` should be a 2-4 capitalized abbreviation of
   the Project name

4. Within your `VSCode` Development Environment (see setup below), start
   work on a development branch named for your specific Project and Issue

   ```bash
   ISSUE_BRANCH_NAME=<PROJECT-ABBR>-<item-number>-<Issue-Short-Title>
   git checkout -b $ISSUE_BRANCH_NAME
   git push -u origin $ISSUE_BRANCH_NAME
   ```

5. As you make changes, follow the [Coding Conventions](#coding-conventions) listed
   below, write tests to cover your changes, improve documentation to cover your
   changes, and make frequent commits with short commit messages loosely following the
   [Anglar convention](https://github.com/angular/angular/blob/main/CONTRIBUTING.md#type)

   ```bash
   <type>(<scope>): <short summary>
   ```

   where \<type\> is one of `build | ci | docs | feat | fix | perf | refactor | test`

6. Once your changes are made, all original and newly added tests pass locally, and
   `pre-commit run --all` runs without error, open a new
   [GitHub Pull Request](https://github.com/andrewenoble-org/aws-cdk-demo/compare)
   with a push from your `VSCode` Development Environment

   ```bash
   make test && make git-push-f M="<commit-message>"
   ```

7. Pull Requests trigger
   [GitHub Actions](https://github.com/andrewenoble-org/aws-cdk-demo/actions),
   including
      * `pr-lint`: runs the [super-linter](https://github.com/github/super-linter).
      * `pr-pages-qc`: checks that `./docsrc/build` runs without error
      * `pr-release`: increments the semantic version from the previous release
      * `pr-test`: runs `pytest` for python versions `3.9` and `3.10` and for operating
        systems `ubuntu-latest` and `macosx-latest`

   Continue to push changes with `make git-push-f M="<commit-message>"` until these Actions
   run without error.  Note that resolution of `Warnings`, though not required, is
   highly encouraged in general

8. Once all Pull-Request-triggered Actions run without error, carefully review the
   GitHub Pull-Request checklist and complete missing action-items

9. Once all action-items are complete, request a review on GitHub.  At least one
   review by one `aws-cdk-demo` owner is required

10. Once all conversation threads raised during review have been resolved, press
   `Squash and Merge` on GitHub to merge to `main`

11. Once the Pull Request is merged, delete the Issue branch from both your `VSCode`
    Development Environment and GitHub

## Coding Conventions

1. Enforce [PEP8](https://peps.python.org/pep-0008/) with
   [pre-commit](https://pre-commit.com/).  See
   [pre-commit config file](https://github.com/andrewenoble-org/aws-cdk-demo/blob/main/.pre-commit-config.yaml)
   for details

2. Use [numpydoc](https://numpydoc.readthedocs.io/en/latest/index.html) docstring style

3. Use meaningful, human-readable names for variables, classes, etc.

4. Avoid complex code blocks.  If required, carefully comment the code block

## Development Environment

1. On your local machine, install and launch
   [Docker Desktop](https://docs.docker.com/desktop/)
   and
   [VSCode](https://code.visualstudio.com/download)

2. Clone the repository

   ```bash
   git clone https://github.com/andrewenoble-org/aws-cdk-demo.git
   ```

3. Within the respository, build a Development Environment `Docker` image and deploy a
   Development Environment `Docker` container

   ```bash
   make build && make run
   ```

   Note: `make run` may fail if another Docker container is using the `8888` port on
   the host machine.  If so, edit the Makefile, changing `8888:8888` to `8889:8888` or
   similar.

4. Open `VSCode`, install
   [Docker Extension](https://code.visualstudio.com/docs/containers/overview),
   and follow the `Docker Extension` instructions to Attach a `VSCode` Window to your
   Docker container

5. Click on the blue `Open Folder` button, and navigate at the top of the `VSCode`
   window to the `/home/project` directory.  This is the containerized Development
   Environment working directory

6. Configure `git` with your name and email using a `bash` function included in the
   containerized Development Environment

   ```bash
   git-config
   ```

7. Install [pre-commit](https://pre-commit.com/) in your Development Environment
   container to activate hooks

   ```bash
   pre-commit install
   ```

8. Check that your Development Environment passes all `pre-commit` checks

   ```bash
   pre-commit run --all
   ```

9. Check that all tests pass with good coverage in your Development Environment

   ```bash
   make test
   ```

10. Install additional `VSCode Extensions` to enable, within a single `VSCode` Window,
    syntax highlighting,
    rendered document previews,
    and Jupyter notebooks

      * [Better TOML](https://marketplace.visualstudio.com/items?itemName=bungcip.better-toml)
      * [HTML Preview](https://marketplace.visualstudio.com/items?itemName=tht13.html-preview-vscode)
      * [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter)
      * [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
      * [reStructuredText](https://marketplace.visualstudio.com/items?itemName=lextudio.restructuredtext)
      * [reStructuredText Syntax highlighting](https://marketplace.visualstudio.com/items?itemName=trond-snekvik.simple-rst)
      * [Preview](https://marketplace.visualstudio.com/items?itemName=searKing.preview-vscode)
      * [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
      * [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance)
      * [sqlfluff](https://marketplace.visualstudio.com/items?itemName=dorzey.vscode-sqlfluff)
      * [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)

Note: This setup has been tested on a MacBookPro with

* MacOSX Ventura v13.2.1
* Docker v20.10.23, build 7155243
* VSCode v1.76.2 (Universal)
* python v3.9.16
* git v2.40.0

## GitHub Configuration

1. The main branch has name `main` rather than `master` or `trunk`, and there is a
   `pages` branch for GitHub Actions deployment of GitHub Pages documenation

2. Under Settings, `Environment` and `Pages` have been configured to enable
   `Build and deployment` of documentation with `GitHub Actions`.  See
   [GitHub Pages documentation](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site#publishing-with-a-custom-github-actions-workflow)

3. Under Settings, `Branches` has been configured with
   * `Branch protection rule` enabled for `[mp][a]*[ie][ns]`
     `Branch pattern name`, applying the protection rule to branches `main` and `pages`
   * Boxes checked under `Protect matching branches` for
     * `Require a pull request before merging`
     * `Require conversation resolution before merging`
     * `Do not allow bypassing the above settings`

## Legal Notice

When contributing to this project, you must agree that you have authored 100% of the
content, that you have the necessary rights to the content and that the content you
contribute may be provided under the project license.
