# Contributing

## Overview
SCALE happens once a year but the team has ongoing projects and prep year round.
If you are interesting in volunteering please request to join our mailing list:
https://lists.linuxfests.org/cgi-bin/mailman/listinfo/tech

## Git

This repository leverages a workflow for committing code called [Github Flow](https://guides.github.com/introduction/flow/).
Below briefly explains how to create a `feature` branch and put in a pull request
to add fixes and features to the code base.

This workflow was chosen for its simplicity and the fact that anything merged to
`master` should be deployable. Github Flow allows developers have the freedom to
work on changes in `feature` branches without effecting what's deployable, other
team members work, or removing commit history. For more documentation on Github
Flow see: https://guides.github.com/introduction/flow/


### The Flow
0. Clone down this repo:
   ```
   git clone git@github.com:socallinuxexpo/scale-network.git
   ```

1. Create a `feature` branch from the repository. Make this branch name related to the
   work being done. The following example makes a `feature` branch for adding
   `coolscript.sh` to the repo:
   ```bash
   cd scale-network
   git checkout -b adding_coolscript
   ```

2. On this new branch go ahead and create, edit, rename, move, or delete files.
   For example lets create, add and commit `coolscript.sh` to the repo:
   ```bash
   cat << EOF > coolscript.sh
   #!/bin/sh
   echo "This script is so cool"
   EOF
   git add coolscript.sh
   git commit -m "Adding coolscript"
   ```

3. Push up this new branch up to Github:
   ```bash
   git push origin adding_coolscript
   ```
   > Note: This assumes write access to branches other than master
   > in the scale-network branch. Reach out to a team member via the
   > [mailing list](https://lists.linuxfests.org/cgi-bin/mailman/listinfo/tech)
   > for access.

4. Create a pull request the `feature` branch against `master` with the proposed
   changes to kick off a discussion. Make sure to fill out the PR template with
   as much information as possible regarding the changes.
5. If further changes are needed before the pull request is merged repeat steps #2
   and #3. Your existing pull request will update automatically!
6. Another SCALE Tech member will review and merge the pull request once the
   branch is approved.
7. Once your branch is merged, sit back and pat yourself on the back for
   improving the repo! Now go back to the `master` branch which is the default branch and
   get the changes that were merged with your `feature` branch:
   ```bash
   git checkout master
   git pull --rebase origin master
   git log  # Check to make sure the merge exists
   ```
8. Go back to step #1 and add more fix and/or features to the repo!

### Common Scenarios

* **Q:** When working on a `feature` branch for a while and it needs to get the
         latest changes that have been merged against `master`. How is that done?

  **A:** _That's easy! First make sure the `feature` branch has everything your_
         _working on committed. Then go back to the `master` branch, `pull --rebase`_
         _to get the latest changes from the Github `master` branch, go back to_
         _the `feature` branch and rebase `master` against it. So it looks_
         _something like this:_
     ```bash
     git checkout master
     git pull --rebase origin master
     git checkout <feature_branch>
     git rebase develop
     ```
