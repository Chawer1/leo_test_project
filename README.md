## Docker

This project uses Docker to run the application. You can use the following commands to start the application.

# Setup
Docker version 24.0.4, build 3713ee1
docker-compose version 1.29.2, build 5becea4c

[Documentation](https://docs.docker.com/desktop/install/ubuntu)

# Docker run
Install gems

```bash
  bundle
```

Build the images

```bash
  docker-compose build
```

Start containers

```bash
  docker-compose up
```

## Problems
# Docker
Not sure if it works correctly. It worked better locally

# docker-compose.yml
Please remove "bundle install --redownload" from the command. I have a problem with the gems, it's unlikely you'll need to force reinstall them, but unfortunately there's no time to solve it

# application.html.erb
Please remove all =begin and =end from the file to start use tailwindcss 

# Membership.rb and User.rb
Maybe it would be better if I kept the role in Membership and the admin status specifically with User