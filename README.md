# Dokku for GitHub Actions

Deploy a master branch to your Dokku server.

This action will deploy the master brunch to your Dokku server via SSH.

## Usage

To use the action simply add the following lines to your `.github/workflows/main.yml`

```
name: CD

on:
  push:
    branches:
      - master

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - name: Dokku deploy
      uses: AlexanderBabel/dokku-github-action@v1.0
      env:
        PRIVATE_KEY: ${{ secrets.PRIVATE_KEY }}
        URL: dokku@example.com:my-app
```

### Required Secrets

You'll need to provide some secrets to use the action.

- **PRIVATE_KEY**: Your SSH private key.

### Required Environments

You'll need to provide some env to use the action.

- **URL**: The ssh url to your dokku server. ie, `dokku@your.site.com:project-name`.
- **BRANCH**: Repository branch that should be used for deploy, `master` is set by default.

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).
