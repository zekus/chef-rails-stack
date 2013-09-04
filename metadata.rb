name "rails-stack"
version "0.1.0"
description "Chef recipe for ubuntu/debian server configuration for rails production stack"
maintainer "Oleg Bovykin"
maintainer_email "oleg.bovykin@gmail.com"

depends "sudo"
depends "apt"
depends "nodejs"
depends "rbenv"
depends "memcached"
depends "logrotate"
depends "nginx"
depends "mysql"
depends "postgresql"
# depends "unicorn"
# depends "puma"
# depends "database"

recipe "rails-stack", "Recipe for provisioning rails server with multiple apps"
recipe "rails-stack::general", "General server installation"
recipe "rails-stack::users", "Users manager"
recipe "rails-stack::apps", "Applications manager"
recipe "rails-stack::directories", "Ruby applications directory manager"
recipe "rails-stack::databases", "Databases manager"