# git

## recover orphaned commits and files and restore a directory after reset
```bash
git reflog --all
# find commit hash from its message
git checkout $COMMIT_HASH -- .
```
