require "./spec_helper"

def sign_hash
  {"name" => "Fake", "email" => "Fake", "phone" => "Fake", "birthdate" => "2018-04-27 19:05:47 -05:00", "sign" => "Fake"}
end

def sign_params
  params = [] of String
  params << "name=#{sign_hash["name"]}"
  params << "email=#{sign_hash["email"]}"
  params << "phone=#{sign_hash["phone"]}"
  params << "birthdate=#{sign_hash["birthdate"]}"
  params << "sign=#{sign_hash["sign"]}"
  params.join("&")
end

def create_sign
  model = Sign.new(sign_hash)
  model.save
  model
end

class SignControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe SignControllerTest do
  subject = SignControllerTest.new

  it "renders sign index template" do
    Sign.clear
    response = subject.get "/signs"

    response.status_code.should eq(200)
    response.body.should contain("Signs")
  end

  it "renders sign show template" do
    Sign.clear
    model = create_sign
    location = "/signs/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Sign")
  end

  it "renders sign new template" do
    Sign.clear
    location = "/signs/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Sign")
  end

  it "renders sign edit template" do
    Sign.clear
    model = create_sign
    location = "/signs/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Sign")
  end

  it "creates a sign" do
    Sign.clear
    response = subject.post "/signs", body: sign_params

    response.headers["Location"].should eq "/signs"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a sign" do
    Sign.clear
    model = create_sign
    response = subject.patch "/signs/#{model.id}", body: sign_params

    response.headers["Location"].should eq "/signs"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a sign" do
    Sign.clear
    model = create_sign
    response = subject.delete "/signs/#{model.id}"

    response.headers["Location"].should eq "/signs"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
