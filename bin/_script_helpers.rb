module ScriptHelpers
  def prefix_message(message) = "[ #{$PROGRAM_NAME} ] #{message}"

  # Prints a message with a specific prefix
  def print_message(message) = puts(prefix_message(message))

  def abort_with_message(message) = abort(prefix_message(message))

  # Executes a system command and aborts if it fails
  def execute(command)
    print_message(command)
    system(command)
    unless $?.success?
      abort_with_message("❌ Error: Command failed. Exiting...")
    end
  end

  # Checks if a given executable is available
  def has_executable?(name)
    system("which #{name} > /dev/null 2>&1")
  end

  def finish
    print_message "🏁 Done."
    exit 0
  end

  def is_first_argument?(*options) = options.include?(ARGV[0])

  def no_arguments? = ARGV.empty?

  def has_arguments? = !no_arguments?
end
