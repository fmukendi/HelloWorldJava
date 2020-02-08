# Hello World Java

https://github.com/Kikobeats/automate-release
https://github.com/conventional-changelog/standard-version
https://github.com/conventional-changelog/releaser-tools



```bash
npm i --save-dev automate-release
npm i --save-dev standard-version
# you wll need to set up a token 
# https://github.com/settings/tokens/new
# Setup token for cli
# Create a new token and set your environment variable CONVENTIONAL_GITHUB_RELEASER_TOKEN to the token you just created. You can google How to set environment variable. The scopes for the token you need is public_repo or repo (if you need to access private repos). More details.
# mukeapps_conventional-github-releaser token : d1b52ffe8559a62caa8a112af02060caa71367d9
npm install -g conventional-github-releaser
npm i --save-dev conventional-github-releaser
npm run release
```

Note: 
- Remember to setup CONVENTIONAL_GITHUB_RELEASER_TOKEN. You can use `direnv` for declaring local development variables.
- https://direnv.net/





```json
{
  "name": "HelloWorldJava",
  "version": "1.1.0",
  "scripts": {
    "release": "standard-version",
    "release:tags": "git push --follow-tags origin master",
    "postrelease": "npm run release:tags"
  },
  "devDependencies": {
    "automate-release": "^0.8.36",
    "npx": "^10.2.2",
    "standard-version": "^7.1.0"
  }
}

```

## Determinate Next Version Based on History

Now that we have a `git commit` convention, we can jump in the next thing, that will make our first release 🎉.

For do that, we are going to use [standard-version](https://github.com/conventional-changelog/standard-version). After reading your git history and it will determinate what is the next release version.

![](https://i.imgur.com/nmfLfkC.png)

[standard-version](https://github.com/conventional-changelog/standard-version) will determinate automagically the next version to release based on your `git history`.

For do that it will consider:

**patches** (`1.0.0` → `1.0.1`)

```bash
git commit -a -m "fix(parsing): fixed a bug in our parser"
```

**features** (`1.0.0` → `1.1.0`)

```bash
git commit -a -m "feat(parser): we now have a parser \o/"
```

**breaking changes** (`1.0.0` → `2.0.0`)

```bash
git commit -a -m "feat(new-parser): introduces a new parsing library
BREAKING CHANGE: new library does not support foo-construct"
```

A release has some tasks associated:

- 👉 Increment the version at `package.json`.
- 👉 Generate a new entry in your `CHANGELOG.md`
- 👉 Create a new specific git commit for the released version.
- 👉 Create a new `git tag` with the version associated.