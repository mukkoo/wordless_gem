Given /^WordPress is already installed$/ do
  in_current_dir do
    `git init`
  end
  create_dir('wp-content/plugins') # Will do for now
end

Then /^a WordPress installation should exist in directory "([^"]*)"$/ do |dir|
  steps %Q{
    Then the following files should exist:
      | #{dir}/index.php            |
      | #{dir}/wp-activate.php      |
      | #{dir}/wp-config-sample.php |
      | #{dir}/wp-settings.php      |
    Then the following directories should exist:
      | #{dir}/wp-content  |
      | #{dir}/wp-admin    |
      | #{dir}/wp-includes |
  }
end