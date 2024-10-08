# Prerequisites
Before you can run this application, ensure you have the following software installed on your machine:

- Ruby (version 2.7.0 or higher recommended)
- Bundler (to manage gem dependencies)
- Git (to clone the repository)
- Docker (optional, for running the application in a container)

### Install ruby

To install Ruby, you can use a version manager such as RVM or rbenv.

```
\curl -sSL https://get.rvm.io | bash -s stable --ruby
rvm install 2.7.0
rvm use 2.7.0 --default
```

### Install Bundler

Once Ruby is installed, you can install Bundler by running:

```
gem install bundler
```

### Install Git

You can check if Git is installed by running:

```
git --version
```

Otherwise, please follow the steps in https://git-scm.com/

## Installation
To set up the project on your local machine, follow these steps:

- Clone the repository. Open your terminal and run:

```
git clone https://github.com/ejaramillom/sentimental_ruby.git
cd sentimental_ruby
```

### Install dependencies:

Run Bundler to install the necessary gems:

```
bundle install
```

### usage

You can invoke the module as follows. Inside the route of the sentimental_ruby folder, run the ruby terminal
and invoke the module with the names of the file you want to analyse, and the output file you want to read:

```
irb =>
=> require_relative 'sentimental_csv_build'
=> SentimentalCSV.file_analyzer('sentiment_results.csv', 'sentiment_analysis.csv')
```
