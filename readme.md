# Hello World Java
https://kamarada.github.io/en/2019/07/14/using-git-with-ssh-keys/#.XkOnXBNKhTY
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
#https://www.npmjs.com/package/conventional-github-releaser
npm install -g conventional-github-releaser
npm i --save-dev conventional-github-releaser
npm run release
```
Note: 
- Remember to setup CONVENTIONAL_GITHUB_RELEASER_TOKEN


## Quick start

[Set up a token first](#setup-token-for-cli).

```sh
$ npm install -g conventional-github-releaser
$ cd my-project
$ conventional-github-releaser -p angular
```

The above generates a GitHub Release based on commits since the last semver tag that match the pattern of a "Feature", "Fix", "Performance Improvement" or "Breaking Changes".

If you first time use this tool and want to generate all previous releases, you could do

```sh
$ conventional-github-releaser -p angular -r 0
```

This will *not* overwrite the releases you have already made. Read ["Regenerate all the releases"](#regenerate-all-the-releases) section if you want to.

All available command line parameters can be listed using [CLI](#cli) : `conventional-github-releaser --help`.

**Hint:** You can alias your command or add it to your package.json. EG: `"github-release": "conventional-github-releaser -p angular -r 0"`.


What the hell are environment variables?
# What the hell are environment variables?

They're just variables you set on your system that various programs/processes can read. A fairly standard example in javascript circles would be setting your `NODE_ENV` variable to "production" or "development", altering how node code is executed on your system (for example showing more debug messaging when in development).

With most shells there's a way to set them for the current session, and a way to set them for all sessions. The following is meant to be a guide on how to set env vars in the various shells.

## Bash (The default shell on OSX)

Setting for the session:

```bash
$ export CONVENTIONAL_GITHUB_RELEASER_TOKEN="d1b52ffe8559a62caa8a112af02060caa71367d9"
$ echo $CONVENTIONAL_GITHUB_RELEASER_TOKEN
```

```bash
$ export MY_VAR="some value"
$ echo $MY_VAR
some value
```

To persist this, you need to edit the `.bash_profile` file inside your home directory to include the following line:

```
# other stuff
export MY_VAR="some value"
```

You then need to make sure your system loads in the new variables. You can do this using the `source` command:

```bash
$ echo $MY_VAR
->
$ source ~/.bash_profile
$ echo $MY_VAR
-> some value
```

## zsh

Pretty much exactly the same as above, but you'll want to edit your `.zshrc` file.



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
