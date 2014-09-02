require 'jekyll'
require 'shoulda'
require 'minitest/assertions'
require 'minitest/autorun'

class Minitest::Test
  def test_dir(*files)
    File.join(File.dirname(__FILE__), *files)
  end

  def capture_stdout
    $old_stdout = $stdout
    $stdout = StringIO.new
    yield
    $stdout.rewind
    return $stdout.string
  ensure
    $stdout = $old_stdout
  end
end
