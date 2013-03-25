lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

RSpec.configure do |config|
  config.mock_with :mocha
end

require 'grocer/error_callback'

describe "Error callbacks" do
  subject do
    Grocer::Connection.new({
      gateway: :gateway,
      port: :port
    })
  end

  context "with no callbacks" do
    it "should run callbacks with no error, then raise" do
      subject.stubs(destroy_connection: nil)
      subject.expects(:connect).raises(ArgumentError).times(3)

      expect {|b| subject.send(:with_connection, &b) }.to raise_error(ArgumentError)
    end
  end

  context "with callbacks" do
    it "runs the callback" do
      @inner_called = false
      @error_called = true

      Grocer.on_connection_error do |error|
        @error_called = true
        error.should be_a(ArgumentError)
      end

      connection_block = proc { @called = true }

      subject.stubs(destroy_connection: nil)
      seq = sequence('seq')
      subject.stubs(:connect).raises(ArgumentError).in_sequence(seq)
      subject.stubs(:connect).returns(nil).in_sequence(seq)

      subject.send(:with_connection, &connection_block)

      @called.should be_true
      @error_called.should be_true
    end
  end
end
