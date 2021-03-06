require "stylr"

module Stylr
  describe FileParser do
    before do
      @config = YAML.load_file('stylr.yml')
    end

    context "sample_1" do
      before(:each) do
        @string = 'spec/txt/sample_1.rb'
        @f = FileParser.new(@string, Lint.new(@config))
      end

      it "checks the file for errors" do
        @f.violations?.should be_false
      end
    end

    context "sample_fail" do
      it "knows when something has failed" do
        @string = "spec/txt/sample_fail.rb"
        @f = FileParser.new(@string, Lint.new(@config))
        @f.violations?.should be_true
      end
    end

    context "sample_pass2" do
      before(:each) do
        @string = "spec/txt/sample_pass2.rb"
        @f = FileParser.new(@string, Lint.new(@config))
      end

      it "doesn't break when shit appears in strings" do
        @f.violations?.should be_false
      end
    end

    context "sample_fail2" do
      before(:each) do
        @string = "spec/txt/sample_fail2.rb"
        @f = FileParser.new(@string, Lint.new(@config))
      end

      it "knows when something has failed" do
        @f.violations?(true).should be_true
      end
    end

    context "sample_fail3" do
      before(:each) do
        @string = "spec/txt/sample_fail3.rb"
        @f = FileParser.new(@string, Lint.new(@config))
      end

      it "knows when something has failed" do
        @f.violations?.should be_true
      end
    end

    context "sample_fail4" do
      before(:each) do
        @string = "spec/txt/sample_fail4.rb"
        @f = FileParser.new(@string, Lint.new(@config))
      end

      it "knows when something has failed" do
        @f.violations?.should be_false
      end
    end

    context "sample_fail5" do
      before(:each) do
        @string = "spec/txt/sample_fail5.rb"
        @f = FileParser.new(@string, Lint.new(@config))
      end

      it "knows when something has failed" do
        @f.violations?.should be_true
      end
    end
  end
end
