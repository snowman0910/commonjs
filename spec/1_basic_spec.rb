require 'import'

describe 'Kernel#import' do
  subject { import('examples/1_basic') }

  describe 'variables' do
    it "defines a variable using exports.setter = value" do
      expect(subject.language).to eql('Ruby')
    end

    it "registers variables" do
      expect(subject.data[:language]).to eql('Ruby')
    end
  end

  describe 'constants' do
    it "defines a constant using exports.setter = value" do
      expect(subject.VERSION_).to eql('0.0.1')
    end

    it "doesn't mess up the global namespace" do
      expect(defined?(VERSION_)).to eql(nil)
    end

    it "should register constants" do
      expect(subject.data[:VERSION_]).to eql('0.0.1')
    end
  end

  describe 'methods' do
    it "defines a method using def exports.a_method" do
      expect(subject.say_hello).to eql("Hello World!")
    end

    it "registers methods" do
      expect(subject.data[:say_hello]).to eql(subject.method(:say_hello))
    end
  end
end
