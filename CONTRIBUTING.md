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

- new tag

```sh
COMMIT_HASH=b0751d5
VERSION=1.1.0
git tag -a v$VERSION $COMMIT_HASH -m $VERSION
```

```sh
git-chglog -o CHANGELOG.md
```

- Push tag

```sh
git push -u origin --all
git push -u origin --tags
```

### Find ignored files

```sh
find . -type f  | git check-ignore --stdin
```
