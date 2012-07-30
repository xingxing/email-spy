# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Gamil" do
  before do
    @test_data = YAML::load(File.read(File.expand_path("spec/fixture/gmail.yml")))
    @contacts = EmailSpy.fetch(@test_data["invitor email"], @test_data["invitor password"], 'gmail')
  end

  it "应该 得到联系人列表" do
    @contacts.first.name.should == @test_data['contact']['name']
    @contacts.first.email.should == @test_data['contact']['email']
    @contacts.size.should == @test_data['contacts count']
  end

  it "不应 包含邀请人的电邮地址" do
    @contacts.map{|c| c.email }.should_not include @test_data['invitor_email']
  end
end
