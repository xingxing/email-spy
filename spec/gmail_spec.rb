# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Gamil" do
  it "得到联系人列表" do
    contacts = EmailSpy.fetch('pandaitest@gmail.com', 'pandai123', 'gmail')
    contacts.first.name.should == '邢星'
    contacts.first.email.should == 'iamxingxing@gmail.com'
  end
end
