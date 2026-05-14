# 🧑‍💻 Personal Portfolio Website

A fully customizable and dynamic personal portfolio built with **Ruby on Rails**, **GraphQL**, and **React**. Designed to be developer-friendly and easy to manage, this portfolio includes a built-in **admin panel** for effortless content management—no need to touch the codebase.

## 🛠 Tech Stack

- **Backend:** Ruby on Rails, GraphQL API  
- **Frontend:** React (SPA with modern UI/UX)  
- **Database:** PostgreSQL  
- **Authentication:** Devise (Admin access)
- **Ruby Version:** 3.2.0
- **Rails Version:** 7.1.5

## ✨ Features

- ✅ Fully customizable via admin panel  
- 🔄 Real-time updates without redeploying  
- 📱 Mobile-responsive and SEO-friendly  
- 🧩 Modular and scalable architecture  
- 🚀 Easy to deploy on platforms like AWS, Heroku or Render

## 👨‍💼 Admin Panel

Update your portfolio content as easily as filling out an online form! The admin dashboard includes sections for:

- 📌 Greeting  – Customize your hero section message and introduction
- 📂 Projects & Experience - Showcase your work, roles, and timeline
- 🛠 Skills & Tools – Add or edit your technical and soft skills
- 🌐 Social Media Links – Manage your links to platforms like GitHub, LinkedIn, etc.
- ✉️ Contact Information - Set your email, location, and other contact details
- 🎓 Certificates – Upload and display your professional certificates and achievements
- 🎨 Themes – Choose or customize visual themes for your site
- 🛠️ Site Configurations – Manage global settings like SEO metadata, default theme, landing animated signature, layout preferences, and site-wide titles

Changes are instantly reflected on the site—no code editing required.

## 🚀 Getting Started

### 📦 1. Prerequisites

#### Make sure you have the following installed on your system:
  
- Ruby 3.2.0
- Node.js 18.x
- PostgreSQL
- Yarn (npm install -g yarn if not already installed)
  
⚠️ It's recommended to use a version manager like rvm for Ruby, and nvm for Node.js.

Before running the app, ensure **PostgreSQL** is installed and a database role exists to match the configuration in `config/database.yml`.

### 2. Create PostgreSQL User
```bash

# Open PostgreSQL shell
psql postgres

# Create a user with login privileges and password
CREATE ROLE pankajroy WITH LOGIN PASSWORD 'mypassword';

# Grant permission to create databases
ALTER ROLE pankajroy CREATEDB;

# Exit
\q
```
🔐 You can use your own username/password, but don't forget to update config/database.yml accordingly.


### 3. To run this project locally:

```bash

# Clone the repo
git clone https://github.com/pankajroy4/portfolio.git

# Navigate into the directory
cd portfolio

# Install dependencies
bundle install
yarn install

# Setup database
rails db:create db:migrate db:seed

You can also update the content in seed.rb to get content updated.
After updating seed.rb , again run the command:   rails db:drop db:create db:migrate db:seed

# Start the Rails and React servers
rails s
 or
 ./bin/dev
```
## 🖼 Live
www.pankajroy.online
