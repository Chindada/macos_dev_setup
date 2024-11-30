# Contributing

## Tools

### Conventional Commit

- install git cz tool global

```sh
npm install -g commitizen
npm install -g cz-conventional-changelog
npm install -g conventional-changelog-cli
echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc
```

- new commit

```sh
git cz
```

### Pre-commit

- install git pre-commit tool global(macOS)

```sh
brew install pre-commit
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
VERSION=2.0.0
git tag -a v$VERSION -m $VERSION
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
