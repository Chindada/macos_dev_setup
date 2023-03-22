# Contributing

## Tools

### Conventional Commit

- install git cz tool global

```sh
sudo npm install -g commitizen
sudo npm install -g cz-conventional-changelog
sudo npm install -g conventional-changelog-cli
echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc
```

- new commit

```sh
git cz
```

### Pre-commit

- install git pre-commit tool global

```sh
pip3 install pre-commit
```

- install/modify from config

```sh
pre-commit autoupdate
pre-commit install
```

```sh
pre-commit run --all-files
```

### Modify CHANGELOG

- git-chglog

```sh
brew tap git-chglog/git-chglog
brew install git-chglog
```

- new tag

```sh
COMMIT_HASH=482f088
VERSION=1.3.0
git tag -a v$VERSION $COMMIT_HASH -m $VERSION
git push -u origin --all
git push -u origin --tags
```

```sh
git-chglog -o CHANGELOG.md
```

### Find ignored files

```sh
find . -type f  | git check-ignore --stdin
```
