%w[general entity admin].each { |name| Role.find_or_create_by(name: name) }
