require "rack/proxy"
require "net/empty_port"

class Anypow::App < Rack::Proxy
  def initialize(server_cmd, opts = {})
    puts "Start anypow server port #{port}, cmd = '#{server_cmd}'"
    @server_pid = spawn_server(server_env, server_cmd)
    Net::EmptyPort.wait(port, 3)

    opts[:backend] = server_url

    trap('TERM') { kill_server }
    trap('INT')  { kill_server }
    trap('QUIT') { kill_server }
    trap('HUP')  { kill_server }
    trap('KILL') { kill_server }
    at_exit { kill_server }

    super(opts)
  end

  private

  def spawn_server(server_env, server_cmd)
    if Anypow.ruby_18?
      require "posix/spawn"
      cmd = expand_cmd(server_cmd, server_env)
      POSIX::Spawn.spawn(*spawn_args(server_env, cmd.shellsplit, {}))
    else
      Process.spawn(server_env, server_cmd)
    end
  end

  def kill_server
    puts "kill server(pid:#{@server_pid})..."
    begin
      Process.kill "SIGKILL", @server_pid
      Process.waitpid @server_pid
    rescue Errno::ESRCH
    end
  end

  def port
    @port ||= Net::EmptyPort.empty_port
  end

  def server_url
    "http://127.0.0.1:#{port}"
  end

  def server_env
    { "PORT" => port.to_s }
  end

  def expand_cmd(server_cmd, server_env)
    expanded_command = server_cmd.dup
    server_env.each do |key, val|
      expanded_command.gsub!("$#{key}", val)
    end
    expanded_command
  end

  def spawn_args(env, argv, options)
    args = []
    args << env
    args += argv
    args << options
    args
  end
end
