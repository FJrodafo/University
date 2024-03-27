<div align="center">
    <a href="https://vercel.com/" target="_blank">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="./Assets/Dark.svg">
            <img alt="logo" height="46" src="./Assets/Light.svg" />
        </picture>
    </a>
</div>

## Index

1. [Introduction](#introduction)
2. [Getting started](#getting-started)
3. [Deploy your app](#deploy-your-app)

## Introduction

Vercel is a cloud platform for static sites and serverless functions. It enables developers to deploy websites and web applications with ease. Originally known as Zeit, Vercel focuses on providing a seamless developer experience by offering features like automatic deployments, continuous integration, and instant scaling. With Vercel, developers can deploy projects built with frameworks like Next.js, React, Vue.js, and more, and leverage serverless functions for backend logic. Vercel's platform is known for its simplicity, speed, and efficiency in deploying modern web applications.

## Getting started

To install Vercel globally, run the following command:

```shell
npm install -g vercel
```

Once you have installed Vercel globally, you can check out a list of commands as follows:

```shell
vercel -h
```

## Deploy your app

```
╭╴fjrodafo@linux[Portfolio](main)
╰─╴$ vercel
Vercel CLI 33.6.1
? Set up and deploy “~/Documents/Git_Repos/Portfolio”? [Y/n] y
? Which scope do you want to deploy to? FJrodafo's projects
? Link to existing project? [y/N] n
? What’s your project’s name? portfolio
? In which directory is your code located? ./App
Local settings detected in vercel.json:
Auto-detected Project Settings (Create React App):
- Build Command: react-scripts build
- Development Command: react-scripts start
- Install Command: `yarn install`, `pnpm install`, `npm install`, or `bun install`
- Output Directory: build
? Want to modify these settings? [y/N] n
🔗  Linked to fjrodafos-projects/portfolio (created .vercel and added it to .gitignore)
🔍  Inspect: https://vercel.com/fjrodafos-projects/portfolio [2s]
✅  Production: https://fjrodafo.vercel.app [2s]
📝  Deployed to production. Run `vercel --prod` to overwrite later (https://vercel.link/2F).
💡  To change the domain or build command, go to https://vercel.com/fjrodafos-projects/portfolio/settings
```

<link rel="stylesheet" href="./../README.css">
<a class="back-to-top" href="#top" title="Back to top">↑</a>