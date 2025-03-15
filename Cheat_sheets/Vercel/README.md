## Index

1. [Introduction](#introduction)
2. [Getting started](#getting-started)
3. [Deploy your app](#deploy-your-app)

## Introduction

Vercel is a cloud platform for static sites and serverless functions. It enables developers to deploy websites and web applications with ease. Originally known as Zeit, Vercel focuses on providing a seamless developer experience by offering features like automatic deployments, continuous integration, and instant scaling. With Vercel, developers can deploy projects built with frameworks like Next.js, React, Vue.js, and more, and leverage serverless functions for backend logic. Vercel's platform is known for its simplicity, speed, and efficiency in deploying modern web applications.

## Getting started

To install Vercel globally, run the following command:

```shell
npm install -g vercel@latest
```

Once you have installed Vercel globally, you can check out a list of commands as follows:

```shell
vercel -h
```

## Deploy your app

```
╭╴fjrodafo@linux[FJrodafo](main)
╰─╴$ vercel
Vercel CLI 33.6.1
? Set up and deploy “~/Documents/Dev/FJrodafo”? [Y/n] Y
? Which scope do you want to deploy to? FJrodafo's projects
? Link to existing project? [y/N] N
? What’s your project’s name? fjrodafo
? In which directory is your code located? ./
Local settings detected in vercel.json:
Auto-detected Project Settings (Create React App):
- Build Command: react-scripts build
- Development Command: react-scripts start
- Install Command: `yarn install`, `pnpm install`, `npm install`, or `bun install`
- Output Directory: build
? Want to modify these settings? [y/N] N
🔗  Linked to fjrodafos-projects/fjrodafo (created .vercel and added it to .gitignore)
🔍  Inspect: https://vercel.com/fjrodafos-projects/fjrodafo [2s]
✅  Production: https://fjrodafo.vercel.app [2s]
📝  Deployed to production. Run `vercel --prod` to overwrite later (https://vercel.link/2F).
💡  To change the domain or build command, go to https://vercel.com/fjrodafos-projects/fjrodafo/settings
```

<link rel="stylesheet" href="./../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>