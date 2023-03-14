# Spam Notifier
This project is a Restful architecture based rails application to notify the spam events on slack channel.

### Features (APIs)
- Create Spam Events
- Analyze spam notifications
- Slack Notifications

### Assumptions
- Possible *types* can only be
  1. SpamNotification
  2. HardBounce
  3. SoftBounce
  4. Delivery
- Slack Notification will only be triggered if type is `SpamNotification` and code is `501`

## Project structure

| Name                          | Description                               |
| ------------------------------|------------------------------------------ |
| app/controllers/api/v1        | Project APIs                              |
| app/models/                   | Models                                    |
| app/middlewares               | Middlewares for custom configs            |


### DEPENDENCIES
- Ruby 3.1.3
- Rails 7.0.4

## PROJECT SETUP

### Install required dependencies
This project was built using Ruby on Rails, it has a variety of dependencies in the form of "ruby gems".
See ruby version in gemfile.

Once you have ruby installed, you will need the bundler gem. To install bundler, simply run:

```
gem install bundler
```

After bundler is installed, run the following command from the root directory of the application (you may need to install some dependencies):

```
bundle install
```

Amazing! Now all of those sweet packages we use to make this application work should be installed.

### Configure database connection
Run the following commands in terminal from the root of the project:

```
rake db:setup
```

### Define the following environment variables
In development environment, create ```.env``` file at root directory and define these variables there.

```
SLACK_API_TOKEN
SLACK_CHANNEL_NAME
```

### Run the project to access the endpoints
Run the following commands in terminal from the root of the project:

```
rails server
```

Hurray! the project is ready to run.

### Notification you'll recieve on slack

Request with Spam Payload detected! \
 **Type**: SpamNotification \
 **Email**: (email) \
 **Description**: (description)
