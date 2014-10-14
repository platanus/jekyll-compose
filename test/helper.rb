require 'jekyll'
require 'shoulda'
require 'minitest/assertions'
require 'minitest/autorun'

include Jekyll

class Minitest::Test
  def test_dir(*files)
    File.join(File.dirname(__FILE__), *files)
  end

  def fixture_site
    Jekyll::Site.new(Jekyll::Utils.deep_merge_hashes(
      Jekyll::Configuration::DEFAULTS,
      { 'source' => test_dir('source'), 'destination' => test_dir('dest') }
    ))
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
