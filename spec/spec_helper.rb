# -*- coding: utf-8 -*-
$:.unshift File.expand_path('../../lib', __FILE__)

require 'rubygems'
require 'bundler/setup'

require 'email-spy'

shared_examples_for "fetch A contact list" do |email_type|
  let(:expected_result) do 
    YAML::load(File.read(File.expand_path("spec/fixture/#{email_type}.yml")))
  end
  
  let(:contacts) do 
    EmailSpy.fetch(expected_result["invitor email"], expected_result["invitor password"], email_type)
  end
  
  it "should return expected contact info" do
    contacts.should include do |contact|
      contact.name == expected_result['contact']['name'] and contact.email == expected_result['contact']['email']
    end
  end

  it "should return expected length" do
    contacts.size.should == expected_result['contacts count']
  end

  it "should not include the invitor's email" do
    contacts.map{|c| c.email }.should_not include expected_result['invitor_email']
  end
end
