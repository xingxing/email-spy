# -*- coding: utf-8 -*-
require 'spec_helper'

describe "EmailSpy" do

  let(:email){ 'iamxingxing@gmail.com' }
  let(:pwd){  'password' }

  describe ".fetch" do
    it "should invoke operating class .fech " do
      EmailSpy::Gmail.should_receive(:fetch).with(email,pwd)
      EmailSpy.fetch(email,pwd,"gmail")
    end

    context "when email type not found" do
      it "should raise A EmailTypeNotFound" do
        lambda { EmailSpy.fetch(email,pwd,"whatever") }.should raise_error(EmailSpy::EmailTypeNotFound)
      end
    end
  end
end
