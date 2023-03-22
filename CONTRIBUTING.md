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
COMMIT_HASH=XXXX
git tag -a v1.1.0 $COMMIT_HASH -m "message"
```

```sh
git-chglog -o CHANGELOG.md
```

### Find ignored files

```sh
find . -type f  | git check-ignore --stdin
```
