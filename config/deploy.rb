set :application, "bartandkat.com"
set :repository,  "svn+ssh://bart@elguapo.homedns.org/home/Documents/subversion/wedding/trunk"
set :application_root, "/home/travell0/#{application}/current/."

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
 set :deploy_to, "/home/travell0/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "75.126.168.192"
role :web, "75.126.168.192"
role :db,  "75.126.168.192", :primary => true

# =============================================================================
# OPTIONAL VARIABLES
# =============================================================================
 set :user, "travell0"
 set :scm_command, "PATH=$PATH:/usr/local/bin svn"
 set :svn, "/usr/local/bin/svn"

# =============================================================================
# SSH OPTIONS
# =============================================================================
 ssh_options[:keys] = %w(~/.ssh/id_dsa)
# ssh_options[:port] = 25

# =============================================================================
# TASKS
# =============================================================================
# Define tasks that run on all (or only some) of the machines. You can specify
# a role (or set of roles) that each task should be executed on. You can also
# narrow the set of servers to a subset of a role by specifying options, which
# must match the options given for the servers to select (like :primary => true)

deploy.task :restart, :roles => :web do
    run "killall -u `whoami` dispatch.fcgi"
end

desc "Displays simple diagnostic information about the server"
deploy.task :bart, :roles => :web do
  run "echo $PATH"
  run "which svn"

  run "export PATH=$PATH:/usr/local/bin"
  run "echo $PATH"
  run "svn"
end

desc "Fixes symlinks and environment for production mode"
deploy.task :after_deploy, :roles => :web do
  run "rm -rf /home/#{user}/public_html/#{application};ln -s #{current_path}/public /home/#{user}/public_html/#{application}"
  run "ln -s ~/#{application}/current/public ~/public_html/#{application}"
  fix_perms
  run "/bin/mv #{deploy_to}/current/config/environment.rb.server #{deploy_to}/current/config/environment.rb"
  restart
end

desc "Sets all file perms (except dispatch.*) to 644 and all directory perms to 755"
deploy.task :fix_perms, :roles => :web do
  run "/usr/bin/find #{deploy_to}/current/ -type f | /usr/bin/xargs /bin/chmod 644"
  run "/usr/bin/find #{deploy_to}/current/ -type d | /usr/bin/xargs /bin/chmod 755"
  run "/bin/chmod 755 #{deploy_to}/current/public/dispatch.*"
end

